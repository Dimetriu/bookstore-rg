class CategoryPresenter < BaseCatalogPresenter

  def name
    category.books.each { |book| book.name }
  end
end
