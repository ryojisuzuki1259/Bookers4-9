class HomesController < ApplicationController
  def top
  end

  def show
    @user = User.find(params[:id])
    @book = Book.all
    @book = Book.new
    @books = current_user.books
  end
end
