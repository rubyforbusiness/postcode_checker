# frozen_string_literal: true

# Postcodes allowed by LSOA
class LsoaAllowedList
  MATCHER = /^Southwark|Lambeth/.freeze
  def initialize(postcode_lsoa_mapper)
    @mapper = postcode_lsoa_mapper
  end

  def include?(normalised_postcode)
    lsoa = mapper.fetch(normalised_postcode, nil)&.fetch("result", nil)&.fetch("lsoa",nil)
    lsoa&.match? MATCHER
  end

  private

  attr_reader :mapper
end
