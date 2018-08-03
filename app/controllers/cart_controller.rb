class CartController < ApplicationController

  def show
    @order_items = current_order.order_items

    # session[:total_quantity] = current_order.order_items.sum(:quantity)
  end
end
