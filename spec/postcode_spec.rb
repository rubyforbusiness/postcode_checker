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

    context 'no digits in postcode' do
      let(:raw_postcode) { 'rubbish' }
      let(:error_message) { 'Sorry that postcode is invalid' }
      it 'raises an exception' do
        expect {
          subject
        }.to raise_error(ArgumentError, error_message)
      end
    end
  end
end