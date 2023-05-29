class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category_id, :title, :describe, :area, :prefecture, :location, :lat, :long, :vehicle, :is_deleted)
  end
  
  def user_params
    params.require(:user).permit(:name, :nick_name, :profile_image, :email, :introduction, :address, :age, :gender, :is_deleted)
  end
  
end
