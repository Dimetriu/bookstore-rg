class AddressController < ApplicationController
  def create
    @billing_address = current_user.addresses.billing.new(address_params)
    @shipping_address = current_user.addresses.shipping.new(address_params)

    if params[:save_billing]
      @billing_address.save!
      flash.now.notice = "Billing Address successfully saved!"
    end

    if params[:save_shipping]
      @shipping_address.save!
      flash.now.notice = "Shipping Address successfully saved!"
    end

    redirect_to user_url(current_user)
  end

  def update
    @billing_address = current_user.addresses.billing.first
    @shipping_address = current_user.addresses.shipping.first

    if params[:save_billing]
      @billing_address.update!(address_params)
      flash.now.notice = "Billing Address successfully saved!"
    end

    if params[:save_shipping]
      @shipping_address.update!(address_params)
      flash.now.notice = "Shipping Address successfully saved!"
    end

    redirect_to user_url(current_user)
  end

  private
    def address_params
      # permitted = %i[]
      params.fetch(:address, {})
    end
end
