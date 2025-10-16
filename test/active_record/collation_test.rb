# frozen_string_literal: true

require_relative '../test_helper'

module ActiveRecord
  class CollationTest < ActiveSupport::TestCase
    setup do
      Client.connection.execute('TRUNCATE clients')
      Client.create(name: 'Alex')
      Client.create(name: 'Bernicé')
      Client.create(name: '😎')
    end

    test 'queries clients using the collation created by the schema' do
      assert_equal(
        ['😎', 'Alex', 'Bernicé'],
        Client.ordered_de.map(&:name)
      )
    end
  end
end
