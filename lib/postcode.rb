# frozen_string_literal: true

# Holds postcodes in standard form
class Postcode
  attr_reader :normalized

  def initialize(raw_postcode)
    @normalized = normalize(raw_postcode)
  end

  private

  def normalize(raw_postcode)
    postcode = raw_postcode.tr(' ', '').upcase
    postcode.match(/\d+/) || raise(ArgumentError, invalid_message(raw_postcode))
    # TODO: add more normalisation e.g. length, some alpha
    postcode
  end

  def invalid_message(raw_postcode)
    format('Sorry %<postcode>s is an invalid postcode',
           postcode: raw_postcode)
  end
end
