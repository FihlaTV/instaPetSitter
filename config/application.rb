require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstaPetSitter
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework  :test_unit, fixture: false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    ### since migration and such fixture columns has not been accordingly and it's causing some issues. hence, set to false
    end
  end
end
