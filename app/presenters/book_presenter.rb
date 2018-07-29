class BookPresenter < BaseCatalogPresenter

  def cover_image(html_options)
    image_tag(book.images.first.url, html_options)
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

  def description
    book.description
  end

  def read_more_link
    h.link_to('Read More', '#description_long', class: 'in-gold-500 ml-10')
  end

  def year_of_publication
    book.year_of_publication.strftime('%Y')
  end

  def dimensions
    height = book.dimensions.height
    width  = book.dimensions.width
    depth  = book.dimensions.depth

    I18n.t('book_presenter.dimensions', height: height, width: width, depth: depth)
  end

  def materials
    book.materials.join(', ')
  end

  def reviews
    if book&.authors.any?
      render partial: 'books/reviews', locals: {presenter: book}
    else
      render partial:'books/review_form', locals: {presenter: book}
    end
  end
end
