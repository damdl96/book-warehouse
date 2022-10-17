# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { build :book }
  describe 'validations' do
    it 'is valid if all the attributes are present' do
      expect(book).to be_valid
    end

    it 'is not valid without a title' do
      book.title = nil
      expect(book).to_not be_valid
    end

    it 'is not valid without an author' do
      book.author = nil
      expect(book).to_not be_valid
    end

    it 'is not valid without a genre' do
      book.genre = nil
      expect(book).to_not be_valid
    end

    it 'will raise an exception if the book already exists on DB' do
      Book.create!(title: 'Book_one', author: 'Author_one', genre: 'genre_one')
      book = Book.new(title: 'Book_one', author: 'Author_one', genre: 'genre_one')
      expect { book.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Title already registered')
    end
  end
end
