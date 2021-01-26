require 'postcode'
RSpec.describe Postcode do

  describe '#normalized' do
    let(:raw_postcode) { 'SE1 7QD' }
    let(:normalized_value) { 'SE17QD' }
    subject do
      described_class.new(raw_postcode).normalized
    end

    it 'normalizes postcodes' do
      expect(subject).to eq(normalized_value)
    end
  end
end