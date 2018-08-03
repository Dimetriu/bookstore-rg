class BooksController < ApplicationController
  layout 'catalog'

  def index
    locals books: Book.order(:name)
  end

  def show
    @book = Book.find(params[:id])

    if user_signed_in?
      order_item = current_order.order_items.find_by("book_id = ?", @book.id)
      new_order_item = current_order.order_items.new(book_id: @book.id)
      @order_item = order_item.nil? ? new_order_item : order_item
    else
      @order_item = OrderItem.new
    end

    render layout: 'application'
  end
end
