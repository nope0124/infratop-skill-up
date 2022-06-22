class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end

  def followings
    user = User.find(params[:user_id])
    @followings = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @followers = user.followers
  end

end
