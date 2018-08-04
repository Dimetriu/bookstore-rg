class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
  end

  # def update
  #   if params["coupon_number"] == current_user.coupon.number
  #     current_order.update_total
  #   end
  # end
end
