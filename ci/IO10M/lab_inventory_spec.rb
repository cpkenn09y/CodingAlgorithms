require 'rspec'
require 'pry'
require_relative 'lab_inventory_service'
require_relative 'item'

describe LabInventoryService do

  let(:item_type) { "NormalItem" }
  let(:item_use_in) { 20 }
  let(:item_quality) { 10 }
  let(:item_refrigerated) { false }
  let(:power_outage) { false }
  let(:item_klass) { Object.const_get item_type rescue Item }
  let(:item) { item_klass.new(type: item_type, use_in: item_use_in, quality: item_quality, refrigerated: item_refrigerated) }
  let(:items) { [item] }

  describe "::update_quality" do
    subject { LabInventoryService.update_quality(items: items, power_outage: power_outage) }

    shared_examples "an item that has a use by date" do
      it "decrements use_in by 1" do
        expect{subject}.to change{item.use_in}.by(-1)
      end
    end

    shared_examples "an item that decays normally" do |parameter|
      it "decrements quality by 1" do
        expect{subject}.to change{item.quality}.by(-1)
      end

      it "does not decay beyond 0 quality" do
        item.quality = 0
        expect{subject}.to_not change{item.quality}
      end

      context "if the use by date has passed" do
        let(:item_use_in) { 0 }

        it "decrements quality by 2" do
          expect{subject}.to change{item.quality}.by(-2)
        end
      end
    end

    describe "normal items" do
      it_behaves_like "an item that has a use by date"
      it_behaves_like "an item that decays normally"
    end

    describe "BacterialCulture" do
      let(:item_type) { "BacterialCulture" }

      it_behaves_like "an item that has a use by date"

      it "increments quality by 1" do
        expect{subject}.to change{item.quality}.by(1)
      end

      context "if the quality is at 50" do
        let(:item_quality) { 50 }

        it "does not increase in quality" do
          expect{subject}.to_not change{item.quality}
        end
      end

      context "when the bacterial culture is expired" do
        let(:item_use_in) { 0 }

        it "increments quality by 2" do
          expect{subject}.to change{item.quality}.by(2)
        end

        context "when the quality is 49" do
          let(:item_quality) { 49 }

          it "does not increase quality above maximum" do
            expect{subject}.to change{item.quality}.by(1)
          end
        end
      end
    end

    describe "Thermometer" do
      let(:item_type) { "Thermometer" }

      it "does not change the use by date" do
        expect{subject}.to_not change{item.use_in}
      end

      it "does not change the quality" do
        expect{subject}.to_not change{item.quality}
      end
    end

    describe "FluVaccine" do
      let(:item_type) { "FluVaccine" }

      it_behaves_like "an item that has a use by date"

      it "increments quality by 1" do
        expect{subject}.to change{item.quality}.by(1)
      end

      context "if the quality is at 50" do
          let(:item_quality) { 50 }

          it "does not increase quality" do
            expect{subject}.to_not change{item.quality}
          end
        end

      context "if the use by date is in 10 days or less" do
        let(:item_use_in) { 10 }

        it "increments quality by 2" do
          expect{subject}.to change{item.quality}.by(2)
        end

        context "if the quality is at 49" do
          let(:item_quality) { 49 }

          it "increases quality by 1" do
            expect{subject}.to change{item.quality}.by(1)
          end
        end
      end

      context "if the use by date is in 5 days or less" do
        let(:item_use_in) { 5 }

        it "increments quality by 3" do
          expect{subject}.to change{item.quality}.by(3)
        end

        context "if the quality is at 48" do
          let(:item_quality) { 48 }

          it "increases quality by 2" do
            expect{subject}.to change{item.quality}.by(2)
          end
        end
      end

      context "if the use by date has passed" do
        let(:item_use_in) { 0 }

        it "sets the quality to 0" do
          expect{subject}.to change{item.quality}.to(0)
        end
      end
    end

    describe "Refrigerated items" do
      let(:item_refrigerated) { true }

      context "if the item is a bacterial culture" do
        let(:item_type) { "BacterialCulture" }

        it "does not change in quality" do
          expect{subject}.to_not change{item.quality}
        end
      end

      context "if there is a power outage" do
        let(:power_outage) { true }

        it "decrements quality by 2" do
          expect{subject}.to change{item.quality}.by(-2)
        end

        context "if the item's use_in date is <0" do
          let(:item_use_in) { 0 }

          it "decrements quality by 4" do
            expect{subject}.to change{item.quality}.by(-4)
          end
        end

        context "if the item is a bacterial culture" do
          let(:item_type) { "BacterialCulture" }

          it "increments quality by 1" do
            expect{subject}.to change{item.quality}.by(1)
          end
        end
      end
    end
  end
end
