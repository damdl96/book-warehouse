# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:book) { create :book }
  let(:store) { create :store }
  let(:inventory) { build :inventory, book:, store: }

  describe 'asociations' do
    it 'is not valid without a book' do
      inventory.book_id = nil
      expect(inventory).not_to be_valid
    end

    it 'is not valid without a store' do
      inventory.store = nil
      expect(inventory).not_to be_valid
    end
  end

  describe 'validations' do
    it 'is valid if all the attributes are present' do
      expect(inventory).to be_valid
    end

    it 'is not valid without an quantity' do
      inventory.quantity = nil
      expect(inventory).not_to be_valid
    end
  end
end
