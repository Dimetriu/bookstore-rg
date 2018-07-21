class Address < ApplicationRecord

  enum kind: [:undefined, :billing, :shipping, :delivery]

  belongs_to :addressable, polymorphic: true

  validates :first_name, :last_name, :address, allow_blank: true, length: { in: 2..50 }
  validates :city, allow_blank: true, length: { in: 2..50 }
  validates :zip, allow_blank: true, length: { in: 2..25 }
  validates :country, allow_blank: true, length: { in: 2..50 }
  validates :phone, allow_blank: true, phone: true
end
