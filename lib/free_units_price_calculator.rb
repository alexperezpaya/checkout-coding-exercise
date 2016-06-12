class FreeUnitsPriceCalculator < StandardPriceCalculator
  def initialize(price, free_unit_for_every:)
    super(price)
    @free_unit_for_every = free_unit_for_every
  end

  def price_for(quantity)
    (quantity - free_items_for(quantity)) * @price
  end

  private

  def free_items_for(quantity)
    (quantity / @free_unit_for_every).to_i
  end
end
