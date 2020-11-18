class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friendships][:friend_id])
    current_user = User.find(params[:friendships][:user_id])
    @friendship = Friendship.new(friendship_params)
    p current_user
    if @friendship.save
      flash[:notice] = 'Friend request sent'
    elsif @friendship.save && @user == current_user
      flash[:notice] = 'Friend request accepted'
    else
      flash[:alert] = 'Failed to add friend'
    end
    redirect_to @user
  end

  private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id)
  end
end
