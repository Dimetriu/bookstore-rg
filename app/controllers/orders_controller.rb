class OrdersController < ApplicationController

  def update
    if params["coupon_number"] == current_user.coupon.number
      current_order.get_discount
    end
  end

  def cancel
    current_order.cancel
  end
end
