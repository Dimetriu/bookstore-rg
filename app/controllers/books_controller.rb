class BooksController < GenericController::BaseCatalogController
  def index
    locals books: Book.all
    new_order = current_user.orders.new
    locals order_item: new_order.order_items.new
  end

  def show
    @book = Book.find(params[:id])
    render layout: 'application'
  end
end
