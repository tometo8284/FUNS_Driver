class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @notifications = current_admin.passive_notifications
  end
end
