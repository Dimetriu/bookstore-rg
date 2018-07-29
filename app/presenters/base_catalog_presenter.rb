class BaseCatalogPresenter < ApplicationPresenter
  presents :category
  presents :book
  delegate :id, to: :book


  def thumbnail(html_options)
    image_tag(book.images.first.url, html_options)
  end

  def price
    h.number_to_currency(book.price, unit: '€', precision: 2)
  end

  def authors
    book.authors.collect { |a| "#{a.first_name} #{a.last_name}" }.join(', ')
  end
end
