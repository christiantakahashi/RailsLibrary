class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to "/books/#{@book.id}"
  end

  private

  def book_params
    params.expect(book: [ :title, :author, :year, :read ])
  end
end
