class Address < ApplicationRecord

  enum kind: [:undefined, :billing, :shipping, :delivery]

  belongs_to :addressable, polymorphic: true

  validates :first_name, :last_name, :address, presence: true, length: { in: 2..50 }
  validates :city, presence: true
  validates :zip, presence: true, length: { in: 2..25 }
  validates :country, presence: true
  validates :phone, presence: true, phone: true
end
