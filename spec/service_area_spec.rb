require 'service_area'
RSpec.describe ServiceArea do

  def make_postcode(postcode_string)
    OpenStruct.new(normalized: postcode_string)
  end

  describe '#servable' do
    let(:postcode) { 'ABC 123' }
    let(:args) { {} }
    subject do
      described_class.new(args).servable?(make_postcode(postcode))
    end
    context 'no lists' do
      it 'is false' do
        expect(subject).to be false
      end
    end

    context 'postcode_allowed_list contains postcode' do
      let(:postcode_allowed_list) { [postcode] }
      let(:args) { {postcode_allowed_list: postcode_allowed_list} }
      it 'is true' do
        expect(subject).to be true
      end
    end

    context 'lsoa_allowed_list contains postcode' do
      let(:lsoa_allowed_list) { [postcode] }
      let(:args) { {lsoa_allowed_list: lsoa_allowed_list} }
      it 'is true' do
        expect(subject).to be true
      end
    end
  end
end