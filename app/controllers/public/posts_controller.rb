class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    5.times { @post.maps.build }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    gon.describe = @post.describe
    if @post.save
       redirect_to @post
       flash[:notice] = "投稿を追加しました"
    else 
       render :new
    end
  end
  
  def show
    @post = Post.find(params[:id]) 
    @user = @post.user 
    if @post.is_deleted == false || @user == current_user
    else
      redirect_to root_path
    end
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to @post
       flash[:notice] = "投稿内容が編集されました"
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = @post.user
    redirect_to user_post_path(@user.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category_id, :title, :describe, :area, :prefecture, :location, :vehicle, :is_deleted, :image, maps_attributes: [:lat, :lng])
  end
end
