# frozen_string_literal: true

require 'postcode'
require 'service_area'
require 'postcode_allowed_list'

# Main controller for application
class PostcodesController < ApplicationController
  helper :postcodes

  def check; end

  def submit
    permitted = params.require(:postcode).permit(:postcode)
    @raw_postcode = permitted[:postcode]
    postcode = Postcode.new(@raw_postcode)
    @message = if postcode.valid?
                 helpers.servable_message(postcode)
               else
                 postcode.validation_message
               end
    render :check
  end
end
