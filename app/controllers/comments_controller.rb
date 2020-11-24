class CommentsController < ApplicationController
  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    unless @comment.save
      flash[:alert].now = @comment.errors.messages.to_s
    end
    redirect_to request.referrer
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      # format.js {}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
