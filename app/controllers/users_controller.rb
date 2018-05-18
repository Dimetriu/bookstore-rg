class UsersController < ApplicationController
  def edit; end

  def update_email
    update_attribute(:email)
  end

  def update_password
    update_attribute(:password)
    bypass_sign_in(current_user)
  end

  private

    def update_attribute(name)
      if current_user.update(attribute_params(name))
        redirect_to users_url, notice: "Yay"
      else
        render :index
      end
    end

    def attribute_params(attribute_name)
      case attribute_name
      when :email
        params.require(:user).permit(:email)
      when :password
        params.require(:user).permit(:password, :current_password, :password_confirmation)
      end
    end
end
