class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friendships][:friend_id])
    @friendship = Friendship.new(friendship_params)
    @friend = Friendship.all.where(friend_id: current_user.id).map(&:user) - current_user.active_friends
    @friendships1 = @friend.map(&:friendships).flatten.map(&:id)
    respond_to do |format|
      if @friendship.save
        format.js do
          if @friendship.save && @user.active_friends.include?(current_user)
            flash.now[:notice] = 'Friend request accepted'
          elsif @friendship.save
            flash.now[:notice] = 'Friend request sent'
          else
            flash.now[:alert] = 'Failed to add friend'
          end
        end
        format.html do
          if @friendship.save && @user.active_friends.include?(current_user)
            flash[:notice] = 'Friend request accepted'
          elsif @friendship.save
            flash[:notice] = 'Friend request sent'
          else
            flash[:alert] = 'Failed to add friend'
          end
          redirect_to request.referrer
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to request.referrer, alert: @friendship.errors.first[1].to_s }
        format.js {}
        format.json { render json: @post.errors.first[1], status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:friendships][:user_id])
    friend = User.find(params[:friendships][:friend_id])
    friend.friendships.find_by(friend_id: @user.id).delete
    redirect_to request.referrer
  end

  private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id)
  end
end


# format.html do
#   if @friendship.save && @user.active_friends.include?(current_user)
#     flash[:notice] = 'Friend request accepted'
#   elsif @friendship.save
#     flash[:notice] = 'Friend request sent'
#   else
#     flash[:alert] = 'Failed to add friend'
#   end
#   redirect_to request.referrer
# end
# format.js do
#   if @friendship.save && @user.active_friends.include?(current_user)
#     flash[:notice] = 'Friend request accepted'
#   elsif @friendship.save
#     flash[:notice] = 'Friend request sent'
#   else
#     flash[:alert] = 'Failed to add friend'
#   end
# end