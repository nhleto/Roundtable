class FriendshipsController < ApplicationController
  def request(current_user, user)
    current_user.send_friend_request(user).create
  end
end
