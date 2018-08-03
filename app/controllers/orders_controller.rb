class OrdersController < ApplicationController

  def update
    if params["coupon_number"] == current_user.coupon.number
      current_order.update_subtotal_with_discount
      redirect_to cart_url, notice: "aaaa"
    else
      redirect_to cart_url, notice: "nnn"
    end
  end

  def destroy
    current_order.cancelled!
  end

  private
    def order_params
      params.require(:order).permit(:coupon_number)
    end
end
