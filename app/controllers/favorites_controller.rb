class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.book_id = params[:book_id]
    favorite.user_id = current_user.id
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(book_id: params[:book_id])
    favorite.book_id = params[:book_id]
    favorite.user_id = current_user.id
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
