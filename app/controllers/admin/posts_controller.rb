class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = @post.user
    redirect_to admin_user_post_path(@user.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category_id, :title, :describe, :area, :prefecture, :location, :lat, :long, :vehicle, :is_deleted)
  end
end
