# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:book) { create :book }
  let(:store) { create :store }

  describe 'validations' do
    let(:inventory) { build :inventory, product: book, store: }

    it 'is valid if all the attributes are present' do
      expect(inventory).to be_valid
    end

    it 'is not valid without a quantity' do
      inventory.quantity = nil
      expect(inventory).not_to be_valid
    end

    it 'is not valid without a store' do
      inventory.store = nil
      expect(inventory).not_to be_valid
    end

    it 'will raise an exception if the inventory already exists' do
      create(:inventory, product: book, store:)
      inventory = build(:inventory, product: book, store:)
      expect do
        inventory.save!
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Product already registered')
    end
  end

  describe 'asociations' do
    let(:inventory) { create :inventory, product: book, store: }

    it 'has one product' do
      expect(inventory.product).to be_instance_of(Book)
    end

    it 'has one store' do
      expect(inventory.store).to be_instance_of(Store)
    end
  end

  describe 'class methods' do
    let!(:inventory) { create :inventory, product: book, store: }
    context '#with_products' do
      it 'loads the product model within the same object' do
        product_title = Inventory.with_products(store_id: store.id).first.product.title
        expect(product_title).to eq book.title
      end
    end
  end
end
