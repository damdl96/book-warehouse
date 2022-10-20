# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session validations', type: :request do
  describe 'signed in' do
    let(:store) { create :store }
    let(:user) { create :user, store: }
    sign_in(:user)

    it 'should respond with success' do
      get '/inventories'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'signed out' do
    it 'should respond with unauthorized' do
      get '/inventories'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
