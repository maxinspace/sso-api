require File.expand_path("../boot", __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBaseApi
  class Application < Rails::Application
    config.middleware.insert_after(ActiveRecord::QueryCache, ActionDispatch::Cookies)
    config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.action_mailer.default_options = { from: ENV.fetch("MAILER_SENDER_ADDRESS") }
    config.action_mailer.default_url_options = { host: ENV.fetch("HOST") }

    config.serve_static_files = false

    # Disable default Rails headers which do not make sense in
    # API-only project (X-Frame-Options, X-XSS-Protection, X-Content-Type-Options)
    config.action_dispatch.default_headers = {}
  end
end
