class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request.referrer
    else
      render :new
      redirect_to request.referrer
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
