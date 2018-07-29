class OrderItem < ApplicationRecord
  belongs_to :order, inverse_of: :order_items
  belongs_to :book, inverse_of: :order_items
  has_one :user, through: :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :setup_prices

  def unit_price
    discount_value = (user.coupon.valid? ? user.coupon.value : 1)
    persisted? ? self[:unit_price] : ((book.price - (book.price * discount_value)).ceil(2))
  end

  def total_price
    (quantity * unit_price)
  end

  private
    def setup_prices
      self[:unit_price] = unit_price
      self[:total_price] = (quantity * self[:unit_price])
    end
end
