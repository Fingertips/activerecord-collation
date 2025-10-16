# frozen_string_literal: true

module ActiveRecord
  module Collation
    # Overrides the PostgresAdapter schema dumper to include collations.
    module SchemaDumper
      extend ActiveSupport::Concern

      def collations(stream)
        collations = @connection.collations
        return unless collations.any?

        stream.puts
        collations.each do |row|
          stream.puts(
            "  create_collation(#{row['collname'].inspect}, #{row['colllocale'].inspect})"
          )
        end
      end

      def trailer(stream)
        collations(stream)
        super
      end
    end
  end
end
