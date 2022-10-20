# frozen_string_literal: true

# Migration to create user associations with store
class AddAssociationsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :store_id, :bigint, null: false
    add_foreign_key :users, :stores, column: :store_id
  end
end
