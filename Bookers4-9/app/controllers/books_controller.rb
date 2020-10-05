class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(current_user), notice: 'You have creatad book successfully.'
    else
      @user = User.find_by(params[:id])
      @books = current_user.books
      render 'homes/show'
    end
  end

  def index
    @books = Book.all
    @user = User.find_by(params[:id])
    @book = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @user = User.find_by(params[:id])
    @book = Book.all
    @book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
