class Admin::HomesController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order("created_at desc")
  end
end
