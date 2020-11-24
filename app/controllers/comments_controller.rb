class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    unless @comment.save
      flash[:alert].now = @comment.errors.messages.to_s
    end
    redirect_to request.referrer
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
