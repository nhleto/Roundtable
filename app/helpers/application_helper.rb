module ApplicationHelper
  def user_avatar(user, size)
    if user.avatar.attached?
      # user.avatar.variant(resize: "#{size}x#{size}!")
      gravatar_image_url(user.email, size: size)
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), class: 'nested_comments')
    end.join.html_safe
  end

  def has_descendants(c)
    Comment.find(c)
  end

  def people_or_person(obj)
    obj.count == 1 ? 'person' : 'people'
  end

  def comment_or_comments(obj)
    obj.count == 1 ? 'comment' : 'comments'
  end

  def like_or_likes(obj)
    obj.count == 1 ? 'like' : 'likes'
  end

  def other_others(obj)
    obj.count - 1 == 1 ? "\u0020 other" : "\u0020 others"
  end

  def and_others(like)
    string = []
    if (like.count - 1).positive?
      string << 'and '
    end
    if (like.count - 1).positive?
      string << like.count - 1
    end
    if (like.count - 1).positive?
      string << other_others(like)
    end
    string << ' liked this post'
    string.join
  end

  def likes_border?(post)
    post.count == 1
  end

  def check_if_friends?(like)
    like.user != current_user && !like.user.friendships.include?(current_user) && like.user.received_friends.include?(current_user)
  end

  def member_or_members(group)
    group.users.count == 1 ? 'Member' : 'Members'
  end
end
