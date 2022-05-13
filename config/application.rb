require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Ukrzaliznytsia
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :en
    config.factory_bot.definition_file_paths = ["spec/factories"]
  end
end
