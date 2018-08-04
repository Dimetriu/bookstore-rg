class OrderPresenter < ApplicationPresenter
  presents :order

  def subtotal
    convert_to_currency(order.subtotal_amount)
  end

  def coupon
    convert_to_currency(order.coupon_value)
  end

  def total
    convert_to_currency(order.total_amount)
  end

  private
    def convert_to_currency(value = nil)
      h.number_to_currency(value, unit: '€', precision: 2)
    end
end
