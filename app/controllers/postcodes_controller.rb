# frozen_string_literal: true

# Main controller for application
class PostcodesController < ApplicationController
  INVALID_MESSAGE = 'Sorry that postcode is invalid'

  def check; end

  def submit
    @message = INVALID_MESSAGE
    render postcodes_check_path
  end
end
