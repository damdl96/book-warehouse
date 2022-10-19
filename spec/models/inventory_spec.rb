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
end
