class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # 絞り込み検索の処理
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
    # 全投稿から人気のカテゴリーをカウント、並べ替え
    @category_ranks = Category.find(Post.group(:category_id).order('count(category_id) desc').pluck(:category_id))
  end
end
