require 'lsoa_allowed_list'
require 'postcode'

RSpec.describe LsoaAllowedList do
  let(:postcode_map) {
    {
    "status": 200,
    "result": {
        "postcode": "SE1 7QD",
        "quality": 1,
        "eastings": 531513,
        "northings": 179395,
        "country": "England",
        "nhs_ha": "London",
        "longitude": -0.106793,
        "latitude": 51.498204,
        "european_electoral_region": "London",
        "primary_care_trust": "Southwark",
        "region": "London",
        "lsoa": "Southwark 034A",
        "msoa": "Southwark 034",
        "incode": "7QD",
        "outcode": "SE1",
        "parliamentary_constituency": "Bermondsey and Old Southwark",
        "admin_district": "Southwark",
        "parish": "Southwark, unparished area",
        "admin_county": null,
        "admin_ward": "St George's",
        "ced": null,
        "ccg": "NHS South East London",
        "nuts": "Lewisham and Southwark",
        "codes": {
            "admin_district": "E09000028",
            "admin_county": "E99999999",
            "admin_ward": "E05011114",
            "parish": "E43000218",
            "parliamentary_constituency": "E14000553",
            "ccg": "E38000244",
            "ccg_id": "72Q",
            "ced": "E99999999",
            "nuts": "UKI44",
            "lsoa": "E01003930",
            "msoa": "E02006802",
            "lau2": "E05011114"
        }
    }
}

  }

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