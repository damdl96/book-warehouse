# frozen_string_literal: true

class Inventory < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :product, polymorphic: true
  belongs_to :store
  validates :product_id, uniqueness: { scope: :store, message: 'already registered' }

  def self.with_products(store_id:)
    self.select(:id, :quantity, :product_type, :product_id).includes(:product).where(store_id:)
  end
end
