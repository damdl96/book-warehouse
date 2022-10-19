# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build :user }
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
  end
end
