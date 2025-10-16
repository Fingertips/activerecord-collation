# frozen_string_literal: true

module ActiveRecord
  module Collation
    class Railtie < Rails::Railtie # :nodoc:
      initializer 'active_record.collation' do
        ActiveSupport.on_load(:active_record_postgresqladapter) do
          ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaDumper.include(
            ActiveRecord::Collation::SchemaDumper
          )
          ActiveSupport.on_load(:active_record) do
            ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements.include(
              ActiveRecord::Collation::SchemaStatements
            )
          end
        end
      end
    end
  end
end
