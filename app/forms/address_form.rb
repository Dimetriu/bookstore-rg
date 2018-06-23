class AddressForm
  include ActiveModel::Model

  attr_accessor :user, :billing_first_name, :billing_last_name, :billing_address,
                :billing_city, :billing_zip, :billing_country, :billing_phone, :shipping_first_name,
                :shipping_last_name, :shipping_address, :shipping_city, :shipping_zip, :shipping_country,
                :shipping_phone

  def initialize(user)
    @user = user
    billing_address = user.addresses.billing.first || @user.addresses.billing.new
    shipping_address = user.addresses.shipping.first || @user.addresses.shipping.new

    @billing_first_name = billing_address.first_name
    @billing_last_name = billing_address.last_name
    @billing_address = billing_address.address
    @billing_city = billing_address.city
    @billing_zip = billing_address.zip
    @billing_country = billing_address.country
    @billing_phone = billing_address.phone

    @shipping_first_name = shipping_address.first_name
    @shipping_last_name = shipping_address.last_name
    @shipping_address = shipping_address.address
    @shipping_city = shipping_address.city
    @shipping_zip = shipping_address.zip
    @shipping_country = shipping_address.country
    @shipping_phone = shipping_address.phone
  end

  def save_billing_address(params)
    return false unless valid?
    address.billing.exists? ? change_billing_address(params) : make_billing_address(params)
    true
  end

  def save_shipping_address(params)
    return false unless valid?
    address.shipping.exists? ? change_shipping_address(params) : make_shipping_address(params)
    true
  end

  private
    def address
      user.addresses
    end

    def params_for(kind, params)
      case kind
      when :billing
        {
          first_name: params[:billing_first_name],
          last_name: params[:billing_last_name],
          address: params[:billing_address],
          city: params[:billing_city],
          zip: params[:billing_zip],
          country: params[:billing_country],
          phone: params[:billing_phone]
        }
      when :shipping
        {
          first_name: params[:shipping_first_name],
          last_name: params[:shipping_last_name],
          address: params[:shipping_address],
          city: params[:shipping_city],
          zip: params[:shipping_zip],
          country: params[:shipping_country],
          phone: params[:shipping_phone]
        }
      end
    end

    def make_billing_address(params)
      address.billing.create(params_for(:billing, params))
    end

    def make_shipping_address(params)
      address.shipping.create(params_for(:shipping, params))
    end

    def change_billing_address(params)
      address.billing.update(params_for(:billing, params))
    end

    def change_shipping_address(params)
      address.shipping.update(params_for(:shipping, params))
    end
end
