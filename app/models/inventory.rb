# frozen_string_literal: true

class Inventory < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :book
  belongs_to :store
end
