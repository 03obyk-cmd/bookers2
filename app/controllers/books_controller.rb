class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :index , status: :unprocessable_entity
    end
  end

  def index
    @books = Book.all
    @book  = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :text)
  end
end
