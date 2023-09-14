class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    rooms = current_admin.rooms
    @user_ids = []
    rooms.each do |r|
      @user_ids << r.user_id
    end
    @notifications = current_admin.passive_notifications
  end
  
  def show
    @room = Room.find(params[:id])
    @dm = Dm.new
    @dms = @room.dms
    @user = @room.user
  end
  
  def create
    @room = Room.new(room_params)
    @room.admin_id = current_admin.id
    @room.save
    redirect_to admin_room_path(@room.id)
  end
  
  private
  
  def room_params
    params.permit(:user_id)
  end
end
