describe FreeUnitsPriceCalculator do
  Given(:price_calculator) { described_class.new(price, free_unit_for_every: free_unit_for_every) }

  context 'with price' do
    Given(:price) { 5 }
    Given(:free_unit_for_every) { 2 }
    Then { price_calculator.price_for(0) == 0 }
    Then { price_calculator.price_for(1) == 5 }
    Then { price_calculator.price_for(2) == 5 }
    Then { price_calculator.price_for(3) == 10 }
    Then { price_calculator.price_for(4) == 10 }
  end
end
