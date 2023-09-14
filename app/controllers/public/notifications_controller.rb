class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notifications = current_user.passive_notifications
  end
  
  def update
    notification = Notification.find(params[:id]) 
    if notification.is_admin == true
      if notification.update(checked: true) 
        redirect_to room_path(current_user)
      end
    end
  end
end
