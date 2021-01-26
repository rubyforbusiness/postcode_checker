require 'service_area'
RSpec.describe ServiceArea do

  def make_postcode(postcode_string)
    OpenStruct.new(normalized: postcode_string)
  end

  describe '#servable' do
    let(:postcode) { 'ABC 123' }
    subject do
      described_class.new.servable?(make_postcode(postcode))
    end
    context 'no lists' do
      it 'is false' do
        expect(subject).to be false
      end
    end
  end
end