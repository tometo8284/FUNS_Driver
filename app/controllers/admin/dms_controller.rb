class Admin::DmsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @dm = Dm.new(dm_params)
    @dm.is_user = false
    @dm.room_id = @room.id
    @admin = Admin.first
    if @dm.save
      notification = current_admin.active_notifications.new(
        room_id: @room.id,
        dm_id: @dm.id,
        visited_id: @room.user_id,
        visitor_id: @admin.id,
        is_admin: true,
        action: 'dm'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
         notification.checked = true
      end
      notification.save if notification.valid?
    end
    redirect_to admin_room_url(@room)
  end
  
  private
  
  def dm_params
    params.require(:dm).permit(:user_id, :message)
  end
end
