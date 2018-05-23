module UsersServices
  module Update
    def self.call(attribute, user, email_params, password_params)
      case attribute
      when :email
        user.update_without_password(email_params)
      when :password
        user.update_with_password(password_params)
      end
    end
  end
end
