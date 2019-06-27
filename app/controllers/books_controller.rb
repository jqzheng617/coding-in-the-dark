class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @pair = Pair.new
  end

  def new
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      redirect_to book_path(@book)
    else
      flash.now[:error] = @book.errors.full_messages
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :author_ids =>[])
  end
end
