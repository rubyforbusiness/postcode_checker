# frozen_string_literal: true

# Holds postcodes in standard form
class Postcode
  INVALID_MESSAGE = 'Sorry that postcode is invalid'
  attr_reader :normalized

  def initialize(raw_postcode)
    @normalized = normalize(raw_postcode)
  end

  private

  def normalize(raw_postcode)
    postcode = raw_postcode.tr(' ', '').upcase
    postcode.match(/\d+/) || raise(ArgumentError, INVALID_MESSAGE)
    postcode
  end
end
