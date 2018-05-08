class SettingsController < ApplicationController
  before_action :set_user

  def index
  end

  def edit
  end

  def update_password
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to settings_url
    else
      render :edit
    end
  end

  private

    def set_user
      @user = current_user
    end
end
