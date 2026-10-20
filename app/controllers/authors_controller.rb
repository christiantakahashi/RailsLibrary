class AuthorsController < ApplicationController
  def index
  @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to author_path(@author), notice: "Autor cadastrado com sucesso"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def author_params
    params.expect(author: [ :name ])
  end
end
