# frozen_string_literal: true

# Migration to create books table
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, nil: false
      t.string :author, nil: false
      t.string :genre, nil: false

      t.timestamps
    end
  end
end
