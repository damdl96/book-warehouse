# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:store) { create :store }

  describe 'validations' do
    let(:user) { build :user, store: }

    it 'is valid if all the attributes are present' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a first name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a store association' do
      user.store = nil
      expect(user).to_not be_valid
    end

    it 'will raise an exception if the user already exists' do
      create(:user, email: 'test@email.com', store:)
      user = build(:user, email: 'test@email.com', store:)
      expect do
        user.save!
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email has already been taken')
    end
  end

  describe 'associations' do
    let(:user) { create :user, store: }

    it 'has one store' do
      expect(user.store).to be_instance_of(Store)
    end
  end
end
