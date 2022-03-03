require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsDemo
  class Application < Rails::Application
    initializer(:remove_activestorage_routes, after: :add_routing_paths) do |app|
      app.routes_reloader.paths.delete_if { |path| path =~ /activestorage|actionmailbox/ }
    end
    config.load_defaults 7.0
    config.api_only = true

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.skip_routes true
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.request_specs false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "*",
                 headers: :any,
                 methods: %i[get post put delete],
                 expose: %w(access-token expiry token-type uid client),
                 max_age: 0
      end
    end
  end
end
