# frozen_string_literal: true

require 'postcode'
require 'service_area'
require 'postcode_allowed_list'

# Main controller for application
class PostcodesController < ApplicationController
  def check; end

  def submit
    permitted = params.require(:postcode).permit(:postcode)
    @raw_postcode = permitted[:postcode]
    postcode = Postcode.new(@raw_postcode)
    @message = case Rails.configuration.service_area.servable?(postcode)
               when true
                 "Good news. #{@raw_postcode} is in our service area"
               else
                 "Sorry #{@raw_postcode} is not in our service area"
               end
    render :check
  rescue StandardError => e
    @message = e.message + ':' + @raw_postcode
    render :check
  end

  private

  def served_message(raw_postcode)
    "Good news. #{raw_postcode} is in our service area"
  end
end
