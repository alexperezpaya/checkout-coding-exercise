describe DiscountOnBulkPriceCalculator do
  Given(:price_calculator) { described_class.new(price, discount_percentage: discount_percentage,
                                                        since_quantity: since_quantity) }

  context 'with price' do
    Given(:price) { 20 }
    Given(:discount_percentage) { 5 }
    Given(:since_quantity) { 3 }
    Then { price_calculator.price_for(0) == 0 }
    Then { price_calculator.price_for(1) == 20 }
    Then { price_calculator.price_for(2) == 40 }
    Then { price_calculator.price_for(3) == 57 }
    Then { price_calculator.price_for(4) == 76 }
    Then { price_calculator.price_for(5) == 95 }
  end
end
