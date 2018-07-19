class BookPresenter < ApplicationPresenter
  presents :book
  delegate :price,
           :images,
           :authors,
    to: :book

  def cover_image
    image_tag(book.images.first.url, class: 'img-responsive')
  end

  def thumbnails
    book.images[1..-1]
  end

  def linked_image(img, html_options)
    h.link_to(book_url, html_options) { image_tag(img.url) }
  end

  def name
    book.name
  end

  def authors
    book.authors.collect { |a| "#{a.first_name} #{a.last_name}" }.join(', ')
  end

  def description
    book.description
  end

  def price
    h.number_to_currency(book.price, unit: '€', precision: 2)
  end
end
