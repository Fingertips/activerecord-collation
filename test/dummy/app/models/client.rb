# frozen_string_literal: true

class Client < ApplicationRecord
  scope :ordered_de, -> { order(collate(:name, :natural_de)) }
  scope :ordered_en, -> { order(collate(:name, :natural_en)) }
end
