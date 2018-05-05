class ShippingAddress < ApplicationRecord
  belongs_to :user, inverse_of: :shipping_address

  validates :address,
            :city,
            :zip,
            :country,
            presence: true
  validates :first_name, :last_name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 2..30 }
  validates :phone, presence: true, phone: true
end
