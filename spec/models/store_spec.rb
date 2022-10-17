# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { build :store }
  describe 'validations' do
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
end
