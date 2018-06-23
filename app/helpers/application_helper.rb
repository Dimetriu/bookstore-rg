module ApplicationHelper

  def form_errors_for(object = nil)
    render 'shared/form_errors', object: object unless object.blank?
  end

  def categories
    Category.order(:name)
  end

  def category
    Category.find_by(name: params[:name])
  end
end
