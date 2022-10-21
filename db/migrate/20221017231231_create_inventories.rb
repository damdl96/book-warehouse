# frozen_string_literal: true

# Migration to create inventories table
class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity, default: 0, null: false
      t.references :product, polymorphic: true
      t.belongs_to :store, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
