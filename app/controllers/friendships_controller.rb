class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friendships][:user_id])
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:notice] = 'Friend request sent'
      redirect_to @user
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
