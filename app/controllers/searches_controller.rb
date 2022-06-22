class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @user_all = User.looks(params[:search], params[:word])
    else
      @book_all = Book.looks(params[:search], params[:word])
    end
  end
end