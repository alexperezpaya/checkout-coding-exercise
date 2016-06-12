class StandardPriceCalculator
  def initialize(price)
    @price = price
  end

  def price_for(quantity)
    quantity * @price
  end
end
