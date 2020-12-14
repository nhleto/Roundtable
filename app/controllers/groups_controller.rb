class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      @group.users << @group.owner
      @group.owner.memberships.last.update_attribute(:admin, true)
    else
      flash[:alert] = @group.errors.messages.to_s
    end
    redirect_to @group
  end

  def destroy; end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.all.order('created_at DESC')
    @post = current_user.posts.build(params[:group_id])
    @comment = @post.comments.build
    @members = @group.users
  end

  def edit
    @group = Group.find(params[:id])
    @group.save
    redirect_to 'groups#show'
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to request.referrer
  end

  private

  # def post_params
  #   params.require(:post).permit(:title, :body, :user_id, :group_id)
  # end

  def group_params
    params.require(:group).permit(:name, :owner_id, :description, :group_photo)
  end
end
