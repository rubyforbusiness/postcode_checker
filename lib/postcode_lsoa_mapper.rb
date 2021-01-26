# frozen_string_literal: true

require 'httparty'
# Maps Postcodes to LSOA areas
class PostcodeLsoaMapper
  def initialize
    @base_url = Rails.configuration.postcode_api['base_url']
    @httparty_options = {
      format: :json
    }
  end

  def fetch(normalised_postcode, default)
    # TODO: cache the results since they won't change very often
    return default unless @base_url.present?

    url = URI("#{@base_url}/#{normalised_postcode}")
    response = HTTParty.send('get', url.to_s, @httparty_options)
    json = JSON.parse(response&.body)
    return default unless json['status'] == 200

    json
  end
end
