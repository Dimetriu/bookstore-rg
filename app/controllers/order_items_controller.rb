class OrderItemsController < ApplicationController
  before_action :set_order_item, except: :create
  after_action  :refresh_order_items, except: :create

  def create
    order_item = current_order.order_items.find_by("book_id = ?", _product_id[:book_id])
    new_order_item = current_order.order_items.new(order_item_params)
    @order_item = order_item.nil? ? new_order_item : order_item

    @order_item.save
  end

  def update
    @order_item.update(order_item_params)
  end

  def destroy
    @order_item.destroy
  end

  private
    def _product_id
      params.require(:order_item).permit(:book_id)
    end

    def order_item_params
      quantity = params.require(:order_item).permit(:quantity)
      _product_id.merge(quantity)
    end

    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def refresh_order_items
      @order_items = current_order.order_items
    end
end
