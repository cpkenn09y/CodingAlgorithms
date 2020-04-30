require 'rspec/autorun'

# Welcome to the One Medical Lab! We have a number of items in stock to make sure
# we can keep our patients happy and healthy.
#
# In our lab, our items degrade in quality as they approach their expiration
# date. In order to keep track of this, we have a service that updates our
# inventory for us. This was built by one of our past employees a few years back
# and is beginning to look dusty.
#
# Basic Parameters for all items:
#   - All items have a use_in value, which denotes the number of days we have to
#   use the item before the expiration date
#   - All items have a quality value, which is never negative and never greater
#   than 50
#
# Daily updates for normal items:
#   - The use_in and quality values decrease by 1
#   - Once the expiration date has passed, the quality value decreases twice as
#   fast
#
# Daily updates for special items:
#   - For "Thermometer" items, since they are nonperishable, the quality and
#   use_in value are not changed
#   - For "BacterialCulture" items, the use_in value decreases by 1, while the
#   quality value increases by 1.  If the bacterial culture item has expired,
#   then the quality increases twice as fast.
#   - For "FluVaccine" items, the use_in value decreases by 1, and the quality
#   value is updated according to the following rules:
#       - Quality increases by 1 when there are more than 10 days before
#       expiration
#       - Quality increases by 2 when there are 6 to 10 days before expiration
#       - Quality increases by 3 when there are 5 days or fewer before expiration
#       - Quality drops to 0 when the flu vaccine has expired
#
# We have recently decided to stock a number of refrigerated medications. This
# requires an update to our system, as we sometimes have power outages.
#
# NEW functionality - Daily updates for refrigerated items:
#   - During a power outage, refrigerated normal items decrease in quality twice
#   as fast as non-refrigerated items
#   - The quality of a refrigerated “BacterialCulture” does not increase.  If
#   there is a power outage, the quality of the refrigerated bacterial culture
#   increases by 1 if it has not expired, and by 2 if it has expired.
#
# The new updating functionality applies only to refrigerated items.
# Non-refrigerated items should continue being updated as before.
#
# In order to add these new features, feel free to make any changes to the
# update_quality method and add any new code. However, please do not alter the
# Item class. This class is owned by a different team and is used in many places.
# Keep in mind that your team will eventually have to add more
# functionality to this, therefore refactoring for readability is important.

class LabInventoryService
  def self.update_quality(items:, power_outage: false)
    items.each do |item|
      case item
      when "BacterialCulture"
        #   - For "BacterialCulture" items, the use_in value decreases by 1, while the
        #   quality value increases by 1.  If the bacterial culture item has expired,
        #   then the quality increases twice as fast.
        item.decrement_use_in!
        item.increment_quality!
        if is_expired?
          item.increment_quality!
        end
      when "FluVaccine"
        #   - For "FluVaccine" items, the use_in value decreases by 1, and the quality
        #   value is updated according to the following rules:
        #       - Quality increases by 1 when there are more than 10 days before
        #       expiration
        #       - Quality increases by 2 when there are 6 to 10 days before expiration
        #       - Quality increases by 3 when there are 5 days or fewer before expiration
        #       - Quality drops to 0 when the flu vaccine has expired

        item.decrement_use_in!
        # item.use_in_above_10
          # INCREMENT QUALITY
        # item.use_in_between_6_and_10
          # INCREMENT QUALITY
          # INCREMENT QUALITY
        # item.use_in_less_than_or_equal_to_5
          # INCREMENT QUALITY
          # INCREMENT QUALITY
          # INCREMENT QUALITY
        # item.is_expired?
          # QUALITY = 0
        # END
        item.handle_quality_based_on_use_in!


      when "Thermometer"
        # QUALITY DOES NOT DEGRADE
      else
        # normal items
        # QUALITY DEGRADES...
        item.decrement_use_in!
        item.decrement_quality!
        if item.is_expired?
          item.decrement_quality!
        end
      end



#       if item.type != "BacterialCulture" and item.type != "FluVaccine"
#         # QUALITY SECTION
#         # if item.quality > 0
#         #   # quality is good
#         #   if item.type != "Thermometer"
#         #     # degrading the quality by 1
#         #     item.quality -= 1
#         #   end
#         # end
#       else
#         if item.quality < 50
#           # cannot go above the limit of 50
#           item.increment_quality!
#           if item.type == "FluVaccine"
#             if item.use_in < 11
#               # item still valid b/c it has not expired
#               if item.quality < 50
#                 # increment the quality by 1
#                 item.increment_quality!

#               end
#             end
#             if item.use_in < 6
#               # item still valid b/c it has not expired
#               if item.quality < 50
#                 # increment the quality by 1
#                 item.increment_quality!
#               end
#             end
#           end
#         end
#       end
#       # if item.type != "Thermometer"
#       #   # decrease the use_in value by 1
#       #   item.use_in = item.use_in - 1
#       # end
#       if item.use_in < 0
#         # item has expired
#         if item.type != "BacterialCulture"
#           if item.type != "FluVaccine"
#             if item.quality > 0
#               if item.type != "Thermometer"
#                 # decrement quality b/c it's a regular item...
#                 item.decrement_quality!
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.increment_quality!
#           end
#         end
#       end
    end
  end
end

### Item Class #################################################################

class Item
  # note: use the instance variables within the class for resetting values
  # example: @use_in = use_in - x. "use_in = use_in - X" will throw an error.
  # This is due to a coderpad bug that resets variables upon declaration.
  attr_accessor :type, :use_in, :quality, :refrigerated

  def initialize(type:, use_in:, quality:, refrigerated:)
    @type = type
    @use_in = use_in
    @quality = quality
    @refrigerated = refrigerated
  end

  def increment_quality!
    @quality += 1
  end

  def decrement_quality!
    if @quality > 0 && @quality < 50
      #   - All items have a quality value, which is never negative and never greater
      #   than 50
      @quality -= 1
    end
  end

  def increment_use_in!
    @use_in += 1
  end

  def decrement_use_in!
    @use_in -= 1
  end

  def set_quality_to_zero!
    @quality = 0
  end

  def handle_quality_based_on_use_in!
    if @use_in > 10
      increment_quality!
    elsif @use_in >= 6 && @use_in <= 10
      increment_quality!
      increment_quality!
    elsif @use_in <= 5 && @use_in >= 0
      increment_quality!
      increment_quality!
      increment_quality!
    elsif
      set_quality_to_zero!
    end
  end

  def is_expired?
    @use_in <= 0
  end

end

### Specs ######################################################################

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

        xit "does not change in quality" do
          expect{subject}.to_not change{item.quality}
        end
      end

      context "if there is a power outage" do
        let(:power_outage) { true }

        xit "decrements quality by 2" do
          expect{subject}.to change{item.quality}.by(-2)
        end

        context "if the item's use_in date is <0" do
          let(:item_use_in) { 0 }

          xit "decrements quality by 4" do
            expect{subject}.to change{item.quality}.by(-4)
          end
        end

        context "if the item is a bacterial culture" do
          let(:item_type) { "BacterialCulture" }

          xit "increments quality by 1" do
            expect{subject}.to change{item.quality}.by(1)
          end
        end
      end
    end
  end
end
