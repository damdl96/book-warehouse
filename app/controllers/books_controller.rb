# frozen_string_literal: true

class BooksController < ApiController
  before_action :authenticate_user!

  def create
    book = Book.new(create_params)
    book.save!
    render json: book
  rescue StandardError => e
    render json: { errors: e.message }, status: :bad_request
  end

  def destroy
    book = Book.destroy(params[:id])
    render json: { message: "Book: #{book.title} by #{book.author} has been deleted" }
  rescue StandardError => e
    render json: { errors: e.message }, status: :bad_request
  end

  private

  def create_params
    params.require(:book).permit(:title, :author, :genre)
  end
end
