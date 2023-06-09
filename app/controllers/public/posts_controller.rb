class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
    5.times { @post.maps.build }
    20.times { @post.map_lines.build }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to @post
       flash[:notice] = "ドライブデータを追加しました"
    else 
       render :new
    end
  end
  
  def show
    @post = Post.find(params[:id]) 
    @user = @post.user 
    @maps = @post.maps
    # 非公開の投稿は投稿者しか見られないようにする処理
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
       flash[:notice] = "ドライブデータが更新されました"
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
    params.require(:post).permit(:category_id, :title, :describe, :area, :prefecture, :location, :vehicle, :is_deleted, :image, maps_attributes: [:id, :lat, :lng, :marker_describe, marker_image: []], map_lines_attributes: [:id, :line_lat, :line_lng])
  end
  
  def is_matching_login_user
    @post = Post.find(params[:id])
      unless @post.user.id == current_user.id
        redirect_to @post
      end
  end
  
end
