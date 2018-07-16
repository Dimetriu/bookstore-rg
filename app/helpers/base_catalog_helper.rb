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

  def book_authors(book)
    book.authors.collect { |a| "#{a.first_name} #{a.last_name}" }.join(', ')
  end
end
