class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    resource.soft_delete
    sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) { redirect_to after_signout_path_for(resource_name) }
  end
end
