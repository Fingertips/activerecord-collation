# frozen_string_literal: true

require_relative '../../test_helper'

module ActiveRecord
  module Collation
    class SchemaStatementsTest < ActiveSupport::TestCase
      def collation_names
        ApplicationRecord.connection.collations.map do |result|
          result['collname']
        end
      end

      test 'creates and drops collations' do
        assert_equal_set(%w[natural_de natural_en], collation_names)
        ApplicationRecord.connection.create_collation(:misc, 'en')
        assert_equal_set(%w[natural_de natural_en misc], collation_names)
        ApplicationRecord.connection.drop_collation(:misc)
        assert_equal_set(%w[natural_de natural_en], collation_names)
      end
    end
  end
end
