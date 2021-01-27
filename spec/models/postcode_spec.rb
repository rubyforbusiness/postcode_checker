# frozen_string_literal: true

require 'postcode'
RSpec.describe Postcode do
  describe '#normalized' do
    let(:raw_postcode) { 'SE1 7QD' }
    let(:normalized_value) { 'SE17QD' }
    subject do
      described_class.new(raw_postcode)
    end

    it 'normalizes postcodes' do
      expect(subject.normalized).to eq(normalized_value)
    end

    it 'marks the postcode as valid' do
      expect(subject.valid?).to be true
    end

    context 'no digits in postcode' do
      let(:raw_postcode) { 'rubbish' }
      let(:error_message) { "Sorry #{raw_postcode} is an invalid postcode" }
      it 'marks the postcode as invalid' do
        expect(subject.valid?).to be false
      end
      it 'sets a validation message' do
        expect(subject.validation_message).to eq error_message
      end
    end
  end
end
