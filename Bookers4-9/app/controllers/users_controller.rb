class UsersController < ApplicationController

  def index
    @users = User.all
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to home_path(@user.id), notice: 'You have updated user successfully.'
    else
      render 'users/edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end
