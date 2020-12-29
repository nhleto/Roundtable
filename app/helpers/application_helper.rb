module ApplicationHelper
  def user_avatar(user, size)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def people_card_header(post)
    if @group && post == @group.memberships
      'Members'
    elsif @friends && post == @friends.uniq! { |friend| friend[:user_id] }
      'Friends'
    else
      'Likes'
    end
  end

  def nav_badge(user)
    if user.date_of_birth.nil?
      received_not_active_friends(user).size + 1
    else
      received_not_active_friends(user).size
    end
  end

  def received_not_active_friends(user)
    user.received_friends - user.active_friends
  end

  def has_descendants(c)
    Comment.find(c)
  end

  def people_or_person(obj)
    obj.size == 1 ? 'person' : 'people'
  end

  def comment_or_comments(obj)
    obj.size == 1 ? 'comment' : 'comments'
  end

  def like_or_likes(obj)
    obj.size == 1 ? 'like' : 'likes'
  end

  def other_others(obj)
    obj.size - 1 == 1 ? "\u0020 other" : "\u0020 others"
  end

  def friend_friends(obj)
    obj.size == 1 ? "\u0020mutual friend" : "\u0020mutual friends"
  end

  def pluralize(obj, word)
    obj.size == 1 ? "\u0020#{word}" : "\u0020#{word}s"
  end

  def and_others(like)
    string = []
    if (like.size - 1).positive?
      string << 'and '
    end
    if (like.size - 1).positive?
      string << like.size - 1
    end
    if (like.size - 1).positive?
      string << other_others(like)
    end
    string << ' liked this post'
    string.join
  end

  def likes_border?(post)
    post.size == 1
  end

  def check_if_friends?(like)
    like.user != current_user && !like.user.friendships.include?(current_user) && like.user.received_friends.include?(current_user)
  end

  def member_or_members(group)
    group.users.count == 1 ? 'Member' : 'Members'
  end

  def find_membership(user, group)
    user.memberships.find_by(group_id: group.id).admin == true if group.id && !user.memberships.find_by(group_id: group.id).nil?
  end

  def break_group_name(name)
    name.chars[0..10].join + '...'
  end
end
