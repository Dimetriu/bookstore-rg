class CategoriesController < ApplicationController
  layout 'catalog'

  def show
    category = Category.find_by(name: params[:name])
    locals books: category.books
  end
end
