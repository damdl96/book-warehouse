# frozen_string_literal: true

# Migration to create stores table
class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
