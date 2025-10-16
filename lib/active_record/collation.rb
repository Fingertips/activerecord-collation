# frozen_string_literal: true

module ActiveRecord
  # Implements tools to manage and use collations in Postgres.
  module Collation
    extend ActiveSupport::Concern

    class_methods do
      def collate(column, collation)
        Arel::Nodes::InfixOperation.new('COLLATE', arel_table[column], Arel.sql(collation.to_s))
      end
    end
  end
end

require 'active_record/collation/schema_dumper'
require 'active_record/collation/schema_statements'
require 'active_record/collation/version'
