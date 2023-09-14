class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:show]
  
  def show
    @room = Room.find(params[:id])
    @dm = Dm.new
    @dms = @room.dms
    @admin = @room.admin
  end
  
  def create
    @room = Room.new(room_params)
    @admin = Admin.first
    @room.admin_id = @admin.id
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(current_user, @room.id)
    end
  end
  
  private
  
  def room_params
    params.permit(:admin_id)
  end
  
  # ログインしているユーザー本人とは違うユーザーのアクセスを制限するメソッド
  def is_matching_login_user
    user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to room_path(current_user), notice: 'そちらのページへのアクセスはできません'
      end
  end
end
