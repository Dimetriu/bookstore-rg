module ApplicationHelper
  def categories
    Category.order(:name)
  end

  def category
    Category.find_by(name: params[:name])
  end
end
