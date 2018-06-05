module Addresses
  class Form
    include ActiveModel::Model

    attr_accessor :first_name,
                  :last_name,
                  :address,
                  :city,
                  :zip,
                  :country,
                  :phone

        validates :first_name,
                  :last_name,
                  :address,
                  :city,
                  :zip,
                  :country,
                  :phone, presence: true

    def initialize(user, params = {})
      @user = user

      @first_name = params.fetch(:first_name, nil)
      @last_name  = params.fetch(:last_name, nil)
      @address    = params.fetch(:address, nil)
      @city       = params.fetch(:city, nil)
      @zip        = params.fetch(:zip, nil)
      @country    = params.fetch(:country, nil)
      @phone      = params.fetch(:phone, nil)
    end

    def save
      # return false unless valid?
      @user.create_billing_address(
        first_name: first_name,
        last_name: last_name,
        address: address,
        city: city,
        zip: zip,
        country: country,
        phone: phone
      )
      true
    end

    def create_shipping_address
      return false unless valid?
      @user.create_shipping_address(
        first_name: first_name,
        last_name: last_name,
        address: address,
        city: city,
        zip: zip,
        country: country,
        phone: phone
      )
      true
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Address')
    end

    private



  end
end
