class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
       redirect_to post_path(post)
       flash[:notice] = "コメントが追加されました。"
    else
       redirect_to post_path(post)
       flash[:notice] = "文字を入力してください。"
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
    flash[:notice] = "コメントを取り消しました。"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
