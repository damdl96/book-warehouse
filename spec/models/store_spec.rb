# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'validations' do
    let(:store) { build :store }
    it 'is valid if all the attributes are present' do
      expect(store).to be_valid
    end

    it 'is not valid without a name' do
      store.name = nil
      expect(store).to_not be_valid
    end

    it 'raises an exception if the store already exist on DB' do
      Store.create!(name: 'Indigo')
      store = Store.new(name: 'Indigo')
      expect do
        store.save!
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been associated')
    end
  end

  describe 'associations' do
    before do
      @store = create(:store)
      book = create(:book)
      create(:inventory, book:, store: @store)
    end

    it 'has many inventories' do
      expect(@store.inventories.first).to be_instance_of(Inventory)
    end

    it 'has many stores through inventories' do
      expect(@store.books.first).to be_instance_of(Book)
    end
  end
end
