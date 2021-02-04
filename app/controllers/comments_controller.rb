class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.all
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:comment][:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referrer }
        format.js {}
      else
        format.html { flash[:alert] = @comment.errors.messages.to_s }
      end
    end
  end

  def like
    @comment = Comment.find(params[:id])
    @like = @comment.likes.build(user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.js {}
        format.html { redirect_to request.referrer }
      else
        format.html { redirect_to request.referrer, alert: "Like Failed to save: #{@like.errors.messages}" }
      end
    end
  end

  def unlike
    @comment = Comment.find(params[:id])
    @like = @comment.likes.find_by(user_id: current_user.id)
    respond_to do |format|
      if @like.destroy
        format.js { render :like }
        format.html { redirect_to request.referrer }
      else
        format.html { redirect_to request.referrer, alert: "Like Failed to destroy: #{@like.errors.messages}" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @children = @comment.descendant_ids
    @post = Post.find_by(id: @comment.post_id)
    respond_to do |format|
      if @comment.destroy
        format.js {}
        format.html { redirect_to request.referrer }
      else
        format.html { redirect_to request.referrer, alert: "Like Failed to destroy: #{@like.errors.messages}" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :parent_id)
  end
end
