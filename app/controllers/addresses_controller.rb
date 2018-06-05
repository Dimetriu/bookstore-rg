class AddressesController < UsersController
  def new
    new_address
  end

  def create
    address = new_address(address_params)
    current_user.billing_address=(address)
  end

  def edit
  end

  def update
  end

  private

    def new_address(params = nil)
      locals address: Address.new(params)
    end

    def address_params
      params.fetch(:address, {})
    end
end
