class OrderItemsController < ApplicationController
  before_action :set_order_item, except: :create
  after_action :restore_order_items, except: :create

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
  end

  def update
    @order_item.update(order_item_params)
  end

  def destroy
    @order_item.destroy
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :book_id)
    end

    def set_order_item
      @order_item = current_order.order_items.find(params[:id])
    end

    def resotre_order_items
      @order_items = current_order.order_items
    end
end
