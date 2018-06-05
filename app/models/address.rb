class Address < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :address,
            :city, :zip, :coutry, :phone,
  presence: true

  validates :first_name, :last_name, length: { in: 2..25 }
  validates :zip, length: { in: 3..25 }
  validates :phone, phone: true
end
