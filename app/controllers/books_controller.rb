class BooksController < GenericController::BaseCatalogController
  def index
    @books = Book.all
  end
end
