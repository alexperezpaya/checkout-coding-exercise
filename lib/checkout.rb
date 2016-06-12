class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    @items.each_with_object(Hash.new(0)) {|i, h| h[i] += 1}
      .map { |k, v| price_calculator_for(k).price_for(v) }
      .reduce(:+)
  end

  private

  def price_calculator_for(item)
    @pricing_rules[item]
  end
end
