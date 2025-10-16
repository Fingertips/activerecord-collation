# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'

Bundler.require(*Rails.groups)

require 'activerecord-collation'

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails.version.split('.')[0, 2].join('.').to_f
    config.eager_load = true
  end
end
