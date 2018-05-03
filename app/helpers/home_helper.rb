module HomeHelper
  def user_avatar(user, options = {})
    if user.image.empty?
      image_tag(user.avatar_url, options)
    else
      image_tag(user.image, options)
    end
  end

  def username(user)
    if user.first_name.empty?
      user.email.split('@').first.capitalize
    else
      user.first_name
    end
  end
end
