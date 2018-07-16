class BooksController < GenericController::BaseCatalogController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    render layout: 'application'
  end
end
