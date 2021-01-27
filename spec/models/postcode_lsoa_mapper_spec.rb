# frozen_string_literal: true

require 'postcode_lsoa_mapper'

RSpec.describe PostcodeLsoaMapper do
  describe '#fetch' do
    let(:normalized_postcode) { 'SE17QD' }
    subject do
      described_class.new.fetch(normalized_postcode, nil)
    end
    context 'a valid normalized postcode' do
      it 'returns a hash with an lsoa' do
        expect(subject).to respond_to(:keys)
        expect(subject['result']).to respond_to(:keys)
        expect(subject['result']['lsoa']).to match(/^Southwark/)
      end
    end
  end
end
