# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  let(:store) { create :store }
  let(:user) { create :user, store: }
  sign_in(:user)

  describe 'GET /inventories' do
    let!(:product) { create :book }
    let!(:inventory) { create :inventory, product:, store: }

    it 'gets all inventories' do
      get '/inventories'

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).first['inventory_id']).to eq inventory.id
    end
  end

  describe 'POST /inventories' do
    let(:product) { create :book }
    it 'creates an inventory' do
      post '/inventories',
           params: { inventory: { product_id: product.id.to_s, product_type: 'Book', quantity: '777' } }, headers: headers

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /inventories/:id' do
    let!(:product) { create :book }
    let!(:inventory) { create :inventory, product:, store: }

    it 'gets all inventories' do
      put "/inventories/#{inventory.id}", params: { inventory: { quantity: '777' } }, headers: headers

      inventory.reload
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).first['quantity']).to eq inventory.quantity
    end
  end
end
