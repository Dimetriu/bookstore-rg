class BookPresenter < ApplicationPresenter
  presents :book
  delegate :price, to: :book

  def price
    h.number_to_currency(book.price, unit: '€', precision: 2)
  end
end
