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

    if @book.save
      redirect_to "/books/#{@book.id}"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to "/books/#{@book.id}"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def book_params
    params.expect(book: [ :title, :author, :year, :read ])
  end
end
