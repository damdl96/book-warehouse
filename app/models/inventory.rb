# frozen_string_literal: true

class Inventory < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :product, polymorphic: true
  belongs_to :store
end
