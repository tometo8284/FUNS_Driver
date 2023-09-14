class Public::DmsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @dm = Dm.new(dm_params)
    @admin = Admin.first
    @dm.is_user = true
    @dm.room_id = @room.id
    if @dm.save
      notification = current_user.active_notifications.new(
        room_id: @room.id,
        dm_id: @dm.id,
        visited_id: @admin.id,
        visitor_id: current_user.id,
        action: 'dm'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
         notification.checked = true
      end
      notification.save if notification.valid?
    end
    redirect_to room_url(@room)
  end
  
  private
  
  def dm_params
    params.require(:dm).permit(:user_id, :message)
  end
end
