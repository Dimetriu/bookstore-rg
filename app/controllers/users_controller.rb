class UsersController < ApplicationController
  def show; end

  def update_email
    update_attribute(:email)
  end

  def update_password
    update_attribute(:password)
    bypass_sign_in(current_user)
  end

  def destroy
    if params[:remove_account]
      current_user.soft_delete
      redirect_to root_url, notice: t('.success')
    else
      flash.now[:error] = t('.error')
      render :show
    end
  end

  private

    def update_attribute(name)
      update_user =
        case name
        when :email
          current_user.update_without_password(email_params)
        when :password
          current_user.update_with_password(password_params)
        end
      if update_user
        redirect_to user_url, notice: t(".#{name}")
      else
        render :show
      end
    end

    def email_params
      params.require(:user).permit(:email)
    end

    def password_params
      params.require(:user).permit(:password, :current_password, :password_confirmation)
    end

    def remove_account_params
      params.require(user).permit(:remove_account)
    end
end
