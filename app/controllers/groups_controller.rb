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
    @posts = @group.posts.all
    @post = current_user.posts.build
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
