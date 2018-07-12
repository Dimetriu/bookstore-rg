class CategoriesController < GenericController::BaseCatalogController

  def show
    @category = Category.find_by(name: params[:name])
  end
end
