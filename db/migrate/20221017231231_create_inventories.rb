# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity, default: 0, null: false
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :store, index: true, foreign_key: true

      t.timestamps
    end
  end
end
