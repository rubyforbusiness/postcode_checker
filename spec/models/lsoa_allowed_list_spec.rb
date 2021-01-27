# frozen_string_literal: true

require 'lsoa_allowed_list'
require 'postcode'

# rubocop:disable Metrics/BlockLength
RSpec.describe LsoaAllowedList do
  describe '#include?' do
    let(:mapper) do
      {
        'SE17QD' => {
          'result' => { 'lsoa' => 'Southwark 034A' }
        },
        'SE19AQ' => {
          'result' => { 'lsoa' => 'Lambeth 123B' }
        }
      }
    end
    subject do
      described_class.new(mapper).include?(normalized_postcode)
    end

    context 'Southwark postcodes' do
      let(:normalized_postcode) do
        Postcode.new('SE1 7QD').normalized
      end
      it 'is true' do
        expect(subject).to be true
      end
    end

    context 'Lambeth postcodes' do
      let(:normalized_postcode) do
        Postcode.new('SE1 9AQ').normalized
      end
      it 'is true' do
        expect(subject).to be true
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
