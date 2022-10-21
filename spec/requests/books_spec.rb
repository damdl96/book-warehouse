# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:store) { create :store }
  let(:user) { create :user, store: }
  sign_in(:user)

  describe 'POST /books' do
    it 'creates a book' do
      post '/books', params: { book: { title: 'Farenheit 451', author: 'Ray Bradbury', genre: 'Fiction' } },
                     headers: headers

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /books' do
    let!(:book) { create :book }
    it 'destroys a book' do
      delete "/books/#{book.id}", headers: headers

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:success)
      expect do
        Book.find(book.id)
      end.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Book with 'id'=#{book.id}")
    end
  end
end
