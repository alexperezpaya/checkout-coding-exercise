describe Checkout do
  let(:pricing_rules) do
    { 'VOUCHER' => FreeUnitsPriceCalculator.new(5.0, free_unit_for_every: 2),
      'TSHIRT'=> DiscountOnBulkPriceCalculator.new(20.0, discount_percentage: 5, since_quantity: 3),
      'MUG' => StandardPriceCalculator.new(7.5) }
  end

  it 'can be initialized with pricing rules' do
    described_class.new(pricing_rules)
  end

  context 'calculates total' do
    Given(:checkout) do
      described_class.new(pricing_rules).tap do |c|
        items.each { |i| c.scan(i) }
      end
    end

    [
      [['VOUCHER', 'TSHIRT', 'MUG'], 32.50],
      [['VOUCHER', 'TSHIRT', 'VOUCHER'], 25.00],
      [['TSHIRT', 'TSHIRT', 'TSHIRT', 'VOUCHER', 'TSHIRT'], 81.00],
      [['VOUCHER', 'TSHIRT', 'VOUCHER', 'VOUCHER', 'MUG', 'TSHIRT', 'TSHIRT'], 74.50]
    ].each do |requirement|
      context "Items: #{requirement[0].join(', ')}" do
        Given(:items) { requirement[0] }
        Then { checkout.total == requirement[1] }
      end
    end
  end
end
