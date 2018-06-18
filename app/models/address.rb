class Address < ApplicationRecord

  enum kind: [:undefined, :billing, :shipping, :delivery]

  belongs_to :addressable, polymorphic: true

  validates :first_name, :last_name, :address,
            :city, :zip, :country, :phone,
  presence: true

  validates :first_name, :last_name, length: { in: 2..25 }
  validates :zip, length: { in: 3..25 }
  validates :phone, phone: true
end
