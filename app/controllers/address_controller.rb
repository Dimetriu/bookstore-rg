class AddressController < ApplicationController
  def create
    execute_action
  end

  def update
    execute_action
  end

  private
    def address_params
      params.require(:address_form).permit(
        :billing_first_name, :billing_last_name, :billing_address,
        :billing_city, :billing_zip, :billing_country, :billing_phone,
        :shipping_first_name, :shipping_last_name, :shipping_address,
        :shipping_city, :shipping_zip, :shipping_country, :shipping_phone,
        :addressable_type, :addressable_id
        )
    end

    def execute_action
      @address_form = AddressForm.new(current_user)

      if params["save_billing"]
        @address_form.save_billing_address(address_params)
        redirect_to user_url(current_user) and return
      end

      if params["save_shipping"]
        @address_form.save_shipping_address(address_params)
        redirect_to user_url(current_user) and return
      end
    end
end
