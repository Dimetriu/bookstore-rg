class ApplicationController < ActionController::Base
  # before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end
end
