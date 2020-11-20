class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friendships][:friend_id])
    @friendship = Friendship.new(friendship_params)
    if @friendship.save && @user.active_friends.include?(current_user)
      flash[:notice] = 'Friend request accepted'
    elsif @friendship.save
      flash[:notice] = 'Friend request sent'
    else
      flash[:alert] = 'Failed to add friend'
    end
    redirect_to request.referrer
  end

  def destroy
    @user = User.find(params[:friendships][:user_id])
    friend = User.find(params[:friendships][:friend_id])
    @user.received_friends.find(friend.id).friendships.find_by(friend_id: @user.id).delete
    redirect_to request.referrer
  end

  private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id)
  end
end
