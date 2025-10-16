# frozen_string_literal: true

require File.expand_path('lib/active_record/collation/version', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'activerecord-collation'
  spec.version = ActiveRecord::Collation::VERSION
  spec.authors = [
    'Manfred Stienstra'
  ]
  spec.email = [
    'manfred@fngtps.com'
  ]
  spec.summary = <<-SUMMARY
  Collation support for Active Record.
  SUMMARY
  spec.description = <<-DESCRIPTION
  Adds methods like create_collation to manage collations in your Ruby on Rials project.
  DESCRIPTION
  spec.homepage = 'https://github.com/Fingertips/activerecord-collation'
  spec.license = 'MIT'

  spec.files = Dir.glob('lib/**/*') + [
    'LICENSE',
    'README.md'
  ]
  spec.require_paths = ['lib']

  spec.required_ruby_version = '> 3.3'

  spec.add_dependency 'activerecord'

  spec.metadata = { 'rubygems_mfa_required' => 'true' }
end
