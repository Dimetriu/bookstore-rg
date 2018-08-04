class ApplicationController < ActionController::Base

  helper_method :current_order

  before_action :set_locale

  # prevents CanCan::AccessDenied with redirect
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # merge default_url_options for devise
  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  # handles the local assignments instead of instances
  def locals(names)
    render locals: names
  end

  # helper method for Presenter class
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  protected
    def current_order
      @_current_order = current_user&.orders&.in_progress&.first ||
      current_user&.orders&.in_progress&.new ||
      Order.in_progress.new
    end
end
