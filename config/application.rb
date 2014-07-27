require File.expand_path('../boot', __FILE__)

require "sprockets/railtie"

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Travelblog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Settings for the blog appearance
    config.blog_site_title = "Travelblog" 

    # Settings for google maps
    config.maps_api_key = "" 

    # Force users to change the password after installing and login with default user
    config.default_login = false

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Berlin'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    # Enable the asset pipeline
    config.assets.enabled = true
    #setting up vendors
    config.assets.paths << "#{Rails.root}/vendor/assets/libs"
    
  end
end
