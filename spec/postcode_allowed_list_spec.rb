require 'postcode_allowed_list'
require 'postcode'

RSpec.describe PostcodeAllowedList do

  describe '#include?' do
    let(:configured_postcode) do
      Postcode.new('SE1 7QA').normalized
    end
    let(:postcodes) do
      Rails.configuration.raw_postcode_allowed_list
        .map { |raw_postcode| Postcode.new(raw_postcode) }
    end
    subject do
      described_class.new(postcodes).include?(configured_postcode)
    end
    it 'is true for a postcode in the config file' do
      expect(subject).to be true
    end
  end
end