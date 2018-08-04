class Order < ApplicationRecord
  default_scope -> { where(state: [:in_progress, :completed]) }

  enum state: {in_progress: 0, completed: 1, cancelled: 2}

  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
  has_many :books, through: :order_items, inverse_of: :orders

  def update_subtotal
    self[:subtotal_amount] = subtotal
    save!
  end

  def update_total
    return if user.coupon.used_at?

    self[:total_amount] = apply_discount_if_available
    save!
  end

  def coupon_value
    self[:subtotal_amount] - self[:total_amount]
  end

  def cancel
    cancelled!
  end

  def complete
    completed!
  end

  def self.cancelled
    unscoped.where(state: :cancelled)
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

        (subtotal - (subtotal * user.coupon.value)).ceil(2)
      end
    end
end
