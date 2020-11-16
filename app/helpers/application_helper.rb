module ApplicationHelper
  def user_avatar(user, size)
    if user.avatar.attached?
      # user.avatar.variant(resize: "#{size}x#{size}!")
      gravatar_image_url(user.email, size: size)
    else
      gravatar_image_url(user.email, size: size)
    end
  end
end
