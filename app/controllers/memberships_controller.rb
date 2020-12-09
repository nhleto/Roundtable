class MembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.new(user_id: current_user.id)
    if !@membership.save
      flash[:alert] = @membership.errors
    end
    redirect_to request.referrer
  end

  def destroy

  end

  private

  def membership_params
    params.require(:memberships).permit(:user_id, :friend_id)
  end
end
