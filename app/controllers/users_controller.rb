class UsersController < ApplicationController
  def show; end

  def create_address
    @user = Address.new(address_params)
    # if @address_form.save!
    #   redirect_to user_url, notice: "Yay created"
    # else
    #   flash.now[:error] = "Not created"
    #   render :index
    # end
  end

  def update_address

  end

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
      render :index
    end
  end

  private

    def update_attribute(name)
      update_user = Users::Update.call(name, current_user, email_params, password_params)
      if update_user
        redirect_to user_url, notice: t(".#{name}")
      else
        render :index
      end
    end

    def address_params
      params.fetch(:billing_address, {})
    end

    # def params_for(name)
    #   params.fetch(:"#{name}", {})
    #   .permit(
    #     :first_name, :last_name, :address,
    #     :city, :zip, :country, :phone
    #     )
    # end

    def email_params
      params.require(:user).permit(:email)
    end

    def password_params
      params.require(:user).permit(:password, :current_password, :password_confirmation)
    end
end
