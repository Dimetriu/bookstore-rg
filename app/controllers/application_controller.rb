class ApplicationController < ActionController::Base

  helper_method :current_order

  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  def locals(names)
    render locals: names
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  protected
    def current_order
      current_user.orders.in_progress.first || current_user.orders.new
    end
end
