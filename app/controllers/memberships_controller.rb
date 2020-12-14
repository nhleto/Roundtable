class MembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.new(user_id: current_user.id)
    if @membership.user == @group.owner
      @membership.update_attribute(:admin, true)
    end
    if !@membership.save
      flash[:alert] = @membership.errors
    end
    redirect_to request.referrer
  end

  def destroy
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.find_by(group_id: @group.id).delete
    redirect_to request.referrer
  end

  def make_admin
    @group = Group.find(params[:group_id])
    @membership = Membership.find_by(user_id: params[:id])
    @membership.update_attribute(:admin, true)
    redirect_to request.referrer
  end

  private

  def membership_params
    params.require(:memberships).permit(:user_id, :friend_id)
  end
end
