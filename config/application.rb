require_relative 'boot'

require 'rails/all'

require_relative '../lib/postcode'
require_relative '../lib/postcode_allowed_list'
require_relative '../app/services/service_area'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Postcodes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.postcode_allowed_list = PostcodeAllowedList.new(
      config_for(:postcode_allowed_list)
         .map { |raw_postcode| Postcode.new(raw_postcode) }
    )
    config.service_area = ServiceArea.new(postcode_allowed_list:
                                     config.postcode_allowed_list)
  end
end
