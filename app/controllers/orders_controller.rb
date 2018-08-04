class OrdersController < ApplicationController

  def update
    if params["coupon_number"] == current_user.coupon.number
      current_order.update_total
    end
  end

  def destroy
    current_order.cancel
  end

  private
    def order_params
      params.require(:order).permit(:coupon_number)
    end
end
