class OrderItem < ApplicationRecord
  belongs_to :order, inverse_of: :order_items
  belongs_to :book, inverse_of: :order_items

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :setup_prices
  after_save  :save_order

  def unit_price
    persisted? ? self[:unit_price] : book.price
  end

  def total_price
    (quantity * unit_price)
  end

  private
    def setup_prices
      self[:unit_price] = unit_price
      self[:total_price] = (quantity * self[:unit_price])
    end

    def save_order
      order.save!
    end
end
