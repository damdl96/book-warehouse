# frozen_string_literal: true

class Book < ApplicationRecord
  validates_presence_of :title, :author, :genre
  validates :title, uniqueness: { scope: :author, message: 'already registered' }

  has_many :inventories, as: :product, dependent: :destroy
  has_many :stores, through: :inventories

  def self.genres
    distinct.select(:genre).order(:genre).all.pluck(:genre)
  end
end
