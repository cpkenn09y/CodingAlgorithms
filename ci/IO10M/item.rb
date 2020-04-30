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
    if @quality > 0 && @quality < 50
      @quality += 1
    end
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
