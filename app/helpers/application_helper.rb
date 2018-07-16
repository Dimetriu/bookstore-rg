module ApplicationHelper

  # add presenter helper
  def present(object, klass = nil)
    klass ||= "#{object.class}".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def form_errors_for(object = nil)
    render 'shared/form_errors', object: object unless object.blank?
  end
end
