class Order < ApplicationRecord

  enum state: {in_progress: 0, completed: 1, cancelled: 2}

  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
  has_many :books, through: :order_items, inverse_of: :orders
end
