class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "正常に編集されました"
       redirect_to admin_user_path(@user.id)
    else
       render :edit
    end
  end
  
  def user_post
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at desc")
  end
  
  def user_comment
    @user = User.find(params[:id])
    @comments = @user.comments.order("created_at desc")
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :nick_name, :profile_image, :email, :introduction, :address, :age, :gender, :is_deleted)
  end
end
