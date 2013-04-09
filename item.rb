class Item

  attr_accessor :quality, :sell_in

  def initialize(name, args)
    @name    = name
    @quality = args[:quality]
    @sell_in = args[:sell_in]
  end

  def daily_update
    reduce_quality
    @sell_in = @sell_in - 1
  end

  private

  def reduce_quality
    @quality = @quality - quality_reduction_amount
    @quality = 0 if @quality < 0
  end

  def quality_reduction_amount
    return -1 if @name == 'cheese'
    sell_date_passed? ? 2 : 1
  end

  def sell_date_passed?
    @sell_in < 0
  end
  
end
