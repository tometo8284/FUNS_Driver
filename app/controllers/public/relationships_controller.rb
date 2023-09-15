class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    is_deleted_user
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end
  
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
    is_deleted_user
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
    is_deleted_user
  end
  
private
  def is_deleted_user
    user = User.find(params[:user_id])
    if user.is_deleted == true
      redirect_to root_path, notice: '＊ユーザーが退会済みの為、アクセスできません'
    end
  end
end
