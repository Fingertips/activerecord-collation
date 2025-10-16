# frozen_string_literal: true

Rails.application.configure do
  config.consider_all_requests_local = true
  config.cache_store = :null_store
  config.active_support.deprecation = :stderr
end
