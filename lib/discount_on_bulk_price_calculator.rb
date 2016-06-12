require_relative 'standard_price_calculator'

class DiscountOnBulkPriceCalculator < StandardPriceCalculator
  def initialize(price, discount_percentage:, since_quantity:)
    super(price)
    @discount_percentage = discount_percentage
    @since_quantity = since_quantity
  end

  def price_for(quantity)
    quantity < @since_quantity ? super : discounted_price_for(quantity)
  end

  private

  def discounted_price_for(quantity)
    quantity * discounted_price
  end

  def discounted_price
    @price * ((100.0 - @discount_percentage) / 100.0)
  end
end
