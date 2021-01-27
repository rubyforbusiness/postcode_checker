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
    @message = if postcode.valid?
                 servable_message(postcode)
               else
                 postcode.validation_message
               end
    render :check
  end

  private

  def servable_message(postcode)
    case Rails.configuration.service_area.servable?(postcode)
    when true
      served_message(@raw_postcode)
    else
      not_served_message(@raw_postcode)
    end
  end

  def served_message(raw_postcode)
    "Good news. #{raw_postcode} is in our service area"
  end

  def not_served_message(raw_postcode)
    "Sorry #{raw_postcode} is not in our service area"
  end
end
