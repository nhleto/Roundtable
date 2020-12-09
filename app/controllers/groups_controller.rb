class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.save
    redirect_to request.referrer
  end

  def destroy; end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.all.order('created_at DESC')
    @post = current_user.posts.build(params[:group_id])
    @comment = @post.comments.build
    @members = @group.users
  end

  private

  # def post_params
  #   params.require(:post).permit(:title, :body, :user_id, :group_id)
  # end

  def group_params
    params.require(:group).permit(:name)
  end
end
