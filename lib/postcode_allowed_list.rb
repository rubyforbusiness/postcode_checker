# frozen_string_literal: true

# Special list of allowed postcodes regardless of API calls etc
class PostcodeAllowedList
  def initialize(postcodes)
    @normalized_postcodes = postcodes.map(&:normalized)
  end

  def include?(postcode)
    normalized_postcodes.include?(postcode)
  end

  private

  attr_reader :normalized_postcodes
end
