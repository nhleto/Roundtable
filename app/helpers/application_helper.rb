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
end
