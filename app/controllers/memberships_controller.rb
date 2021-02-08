class MembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.new(user_id: current_user.id)
    @user = User.find_by(id: @membership.user_id)
    if @membership.user == @group.owner
      @membership.update_attribute(:admin, true)
    end
    respond_to do |format|
      if @membership.save
        format.js { flash.now[:notice] = "Joined #{@group.name}!" }
        format.html { redirect_to request.referrer }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to request.referrer }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.find_by(group_id: @group.id)
    @user = User.find_by(id: @membership.user_id)
    respond_to do |format|
      if @membership.destroy
        format.js { flash.now[:alert] = "Left #{@group.name}!" }
        format.html { redirect_to request.referrer }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to request.referrer }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
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
