class Public::HomesController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
    @category_ranks = Category.find(Post.group(:category_id).order('count(category_id) desc').pluck(:category_id))
  end
end
