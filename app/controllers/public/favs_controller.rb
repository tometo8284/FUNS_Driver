class Public::FavsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    fav = current_user.favs.new(post_id: post.id)
    fav.save
    redirect_to post_path(post)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    fav = current_user.favs.find_by(post_id: post.id)
    fav.destroy
    redirect_to post_path(post)
  end
end
