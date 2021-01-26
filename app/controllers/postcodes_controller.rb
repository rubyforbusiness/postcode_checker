# frozen_string_literal: true

require 'postcode'

# Main controller for application
class PostcodesController < ApplicationController
  def check; end

  def submit
    permitted = params.require(:postcode).permit(:postcode)
    @raw_postcode = permitted[:postcode]
    postcode = Postcode.new(@raw_postcode)
    @message = "Good news. #{@raw_postcode} is in our service area"
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
