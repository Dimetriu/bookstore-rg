class BooksController < ApplicationController
  layout 'catalog'

  def index
    locals books: Book.order(:name)
  end

  def show
    @book = Book.find(params[:id])
    user_signed_in? ? process_order_item : @order_item = OrderItem.new
    render layout: 'application'
  end

  private
    def process_order_item
      order_item = current_order.order_items.find_by("book_id = ?", @book.id)
      new_order_item = current_order.order_items.new(book_id: @book.id)
      @order_item = order_item.nil? ? new_order_item : order_item
    end
end
