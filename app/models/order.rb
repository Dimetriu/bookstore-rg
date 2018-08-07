class Order < ApplicationRecord
  default_scope -> { where(state: [:in_progress, :completed]) }

  enum state: {in_progress: 0, completed: 1, cancelled: 2}

  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
  has_many :books, through: :order_items, inverse_of: :orders

  before_save :update_amounts

  def update_amounts
    self[:subtotal_amount] = calculate_for(:subtotal)
    user.coupon.used_at? ? self[:total_amount] = calculate_for(:total) : self[:total_amount] = calculate_for(:subtotal)
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
    def calculate_for(name)
      order_items.collect do |item|
        return unless item.valid?
        case name
        when :subtotal
          subtotal(item)
        when :total
          total(item)
        else
          0
        end
      end.sum
    end

    def subtotal(item)
      (item.quantity * item.unit_price)
    end

    def total(item)
      ((item.quantity * item.unit_price) - ((item.quantity * item.unit_price) * user.coupon.value)
      .ceil(2))
    end
end
