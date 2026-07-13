# frozen_string_literal: true

module ActiveRecord
  module Collation
    # Defines methods to create, drop, and inspect collations on a schema in Postgres.
    module SchemaStatements
      def create_collation(name, icu_locale)
        execute(
          'CREATE COLLATION IF NOT EXISTS ' \
          "#{name} (provider = icu, locale = #{quote(icu_locale)})"
        )
      end

      def drop_collation(name)
        execute(
          "DROP COLLATION IF EXISTS #{name}"
        )
      end

      def collations
        select_all(collations_sql, 'SCHEMA')
      end

      private

      def collations_sql # rubocop:disable Metrics/MethodLength
        if database_version >= 170_000
          <<~SQL
            SELECT
              pg_collation.collname,
              pg_collation.colllocale
            FROM pg_collation
            JOIN pg_namespace
            ON pg_collation.collnamespace = pg_namespace.oid AND pg_namespace.nspname = 'public'
          SQL
        else
          <<~SQL
            SELECT
              pg_collation.collname,
              pg_collation.colliculocale AS colllocale
            FROM pg_collation
            JOIN pg_namespace
            ON pg_collation.collnamespace = pg_namespace.oid AND pg_namespace.nspname = 'public'
          SQL
        end
      end
    end
  end
end
