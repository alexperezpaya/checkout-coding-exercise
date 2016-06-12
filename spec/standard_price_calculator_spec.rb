describe StandardPriceCalculator do
  Given(:price_calculator) { described_class.new(price) }

  context 'with price' do
    Given(:price) { 7.5 }
    Then { price_calculator.price_for(0) == 0 }
    Then { price_calculator.price_for(1) == 7.5 }
    Then { price_calculator.price_for(2) == 15 }
  end
end
