class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    @book_new = Book.new
    @user_all = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @book_all = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def correct_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end


end
