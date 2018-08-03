class Order < ApplicationRecord

  enum state: {in_progress: 0, completed: 1, cancelled: 2}

  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
  has_many :books, through: :order_items, inverse_of: :orders

  def update_subtotal
    self[:subtotal_amount] = subtotal
    save!
  end

  private
    def subtotal
      order_items.collect do |item|
        if item.valid?
          (item.quantity * item.unit_price)
        else
          0
        end
      end.sum
    end

    def apply_discount_if_available
      Order.transaction do
        raise ActiveRecord::Rollback if user.coupon.used_at?

        User.transaction do
          user.use_coupon!
          save!
        end

        self[:subtotal_amount] = (subtotal - (subtotal * user.coupon.value)).ceil(2)
      end
    end
end
