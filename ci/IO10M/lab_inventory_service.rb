class LabInventoryService
  def self.update_quality(items:, power_outage: false)
    items.each do |item|
      is_not_properly_refrigerated = item.refrigerated && power_outage
      case item.type
      when "BacterialCulture"
        #   - For "BacterialCulture" items, the use_in value decreases by 1, while the
        #   quality value increases by 1.  If the bacterial culture item has expired,
        #   then the quality increases twice as fast.
        if item.refrigerated
          # do nothing
          if is_not_properly_refrigerated
            item.increment_quality!
          end
        else
          item.decrement_use_in!
          item.increment_quality! # increment default per day
          if item.is_expired?
            item.increment_quality!
          end
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
        item.handle_quality_based_on_use_in!
      when "Thermometer"
        # QUALITY DOES NOT DEGRADE
      else
        # normal items
        item.decrement_use_in!
        item.decrement_quality! # normal degredation
        item.decrement_quality! if is_not_properly_refrigerated
        if item.is_expired?
          item.decrement_quality! # extra degradation due to expired
        end

        if item.is_expired? && is_not_properly_refrigerated
          item.decrement_quality!
        end
      end
    end
  end
end
