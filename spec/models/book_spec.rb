# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    let(:book) { build :book }

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
      create(:book, title: 'Book_one', author: 'Author_one', genre: 'genre_one')
      book = build(:book, title: 'Book_one', author: 'Author_one', genre: 'genre_one')
      expect { book.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Title already registered')
    end
  end

  describe 'associations' do
    context 'with inventories' do
      let!(:book) { create :book }
      let!(:store) { create :store }
      before { create(:inventory, product: book, store:) }

      it 'has many inventories' do
        expect(book.inventories.first).to be_instance_of(Inventory)
      end

      it 'has many stores through inventories' do
        expect(book.stores.first).to be_instance_of(Store)
      end
    end

    context 'without inventories' do
      let(:book) { create :book }
      it "doesn't have any inventories" do
        expect(book.inventories).to match_array([])
      end
    end
  end
end
