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
      redirect_to book_path(@book), notice: "Livro cadastrado com sucesso."
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
      redirect_to book_path(@book), notice: "Livro atualizado com sucesso."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to books_path, notice: "Livro deletado com sucesso.", status: :see_other
  end

  private

  def book_params
    params.expect(book: [ :title, :author_id, :year, :read ])
  end
end
