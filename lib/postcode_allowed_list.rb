# frozen_string_literal: true

# Special list of allowed postcodes regardless of API calls etc
class PostcodeAllowedList
  def initialize(postcodes)
    @normalized_postcodes = postcodes.map(&:normalized)
  end

  def include?(normalised_postcode)
    normalized_postcodes.include?(normalised_postcode)
  end

  private

  attr_reader :normalized_postcodes
end
