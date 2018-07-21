class Order < ApplicationRecord
  has_many :order_items, dependent: :nullify
  belongs_to :user
end
