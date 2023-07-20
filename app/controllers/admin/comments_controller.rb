class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    # 削除前に居たページへと戻す
    redirect_to request.referer
    flash[:notice] = "コメントを削除しました。"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
