# frozen_string_literal: true

class Store < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: { message: 'has already been associated' }

  has_many :inventories
  has_many :books, through: :inventories
end
