module BooksHelper
  def formatted_price(number)
    number_to_currency(number, unit: '€', precision: 2)
  end
end
