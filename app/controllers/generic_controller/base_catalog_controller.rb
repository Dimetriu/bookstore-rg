class GenericController::BaseCatalogController < ApplicationController
  layout 'catalog'

  def locals(names)
    render locals: names
  end
end
