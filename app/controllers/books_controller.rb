class BooksController < GenericController::BaseCatalogController
  def index
    locals books: Book.all
    locals order_item: current_order.order_items.new
  end

  def show
    @book = Book.find(params[:id])
    render layout: 'application'
  end
end
