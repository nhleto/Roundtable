module UsersHelper
  def received_not_active_friends(user)
    user.received_friends - user.active_friends
  end
end
