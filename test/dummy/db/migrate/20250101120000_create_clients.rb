# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.text :name, null: false
    end
  end
end
