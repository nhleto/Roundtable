class FriendshipsController < ApplicationController
  def create(current_user, user)
    current_user.send_friend_request(user).create
  end
end
