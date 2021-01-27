# frozen_string_literal: true

# Holds postcodes in standard form
class Postcode
  attr_reader :normalized, :validation_message

  def initialize(raw_postcode)
    @valid = false
    @validation_message = nil
    @normalized = normalize(raw_postcode)
  end

  def valid?
    @valid
  end

  private

  def normalize(raw_postcode)
    begin
      code = raw_postcode.tr(' ', '').upcase
      code.match(/\d+/) || raise(ArgumentError, invalid_message(raw_postcode))
      @valid = true
      # TODO: add more normalisation e.g. length, some alpha
    rescue ArgumentError => e
      @valid = false
      @validation_message = e.message
    end
    code
  end

  def invalid_message(raw_postcode)
    format('Sorry %<postcode>s is an invalid postcode',
           postcode: raw_postcode)
  end
end
