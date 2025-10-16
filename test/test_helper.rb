# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('dummy/config/environment', __dir__)
require 'minitest/autorun'

def load_support
  Dir[File.expand_path('support/**/*.rb', __dir__)].each { |file| require file }
end
load_support

module ActiveSupport
  class TestCase
    include Assertions
  end
end
