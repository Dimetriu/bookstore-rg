module BaseCatalogHelper

  def categories
    Category.order(:name)
  end

  def category
    Category.find_by(name: params[:name])
  end

  def all_books_count
    Book.count
  end
end
