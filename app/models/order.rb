class Order < ApplicationRecord

  enum state: {in_progress: 0, completed: 1, cancelled: 2}

  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
  has_many :books, through: :order_items, inverse_of: :orders

  before_save :update_subtotal

  def subtotal
    order_items.collect do |item|
      if item.valid?
        (item.quantity * item.unit_price)
      else
        0
      end
    end.sum
  end

  private
    def update_subtotal
      self[:subtotal_amout] = subtotal
    end
end
