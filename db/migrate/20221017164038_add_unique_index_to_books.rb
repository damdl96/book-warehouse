# frozen_string_literal: true

# Migration to validate uniqueness of books in DB
class AddUniqueIndexToBooks < ActiveRecord::Migration[7.0]
  def change
    add_index :books, %i[title author], unique: true
  end
end
