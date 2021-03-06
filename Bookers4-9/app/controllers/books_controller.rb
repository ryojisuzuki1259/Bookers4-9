class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path, notice: 'You have creatad book successfully.'
    else
      @user = User.find(params[:id])
      @books = @user.books
      render 'homes/show'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
