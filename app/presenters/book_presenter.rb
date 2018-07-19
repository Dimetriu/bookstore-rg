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
    markdown(book.description)
  end
end
