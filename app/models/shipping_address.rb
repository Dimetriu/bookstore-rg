class ShippingAddress < ApplicationRecord
  belongs_to :user, inverse_of: :shipping_address
end
