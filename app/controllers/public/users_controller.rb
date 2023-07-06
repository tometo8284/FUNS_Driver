class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, except: [:show, :user_post, :user_fav]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
      flash[:notice] = "ユーザー情報が更新されました。"
    else
      render :edit
    end
  end
    
  def unsubscribe
    @user = current_user
  end
  
  def withdrawl
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了いたしました。"
    redirect_to root_path
  end
  
  def user_post
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order("created_at desc")
  end
  
  def user_fav
    @user = User.find(params[:id])
    @favs = @user.favs.order("created_at desc")
  end
  
  
  
private
  def user_params
    params.require(:user).permit(:name, :nick_name, :profile_image, :email, :introduction, :address, :age, :gender, :is_deleted)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to current_user
      end
  end
end
