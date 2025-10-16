# frozen_string_literal: true

class CreateNaturalCollations < ActiveRecord::Migration[8.0]
  def change
    create_collation(:natural_de, 'de-u-kn-true-ks-level1-ka-shifted-kv-symbol')
    create_collation(:natural_en, 'en-u-kn-true-ks-level1-ka-shifted-kv-symbol')
  end
end
