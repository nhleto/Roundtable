class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to request.referrer
    else
      flash[:alert].now = "#{@comment.errors.messages}"
      redirect_to request.referrer
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
