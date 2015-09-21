class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_filter :new_message
  before_filter :validate_referer

  def default_url_options(options={})
    if I18n.locale != I18n.default_locale
      { :locale => I18n.locale }
    else
      { :locale => I18n.default_locale }
    end
  end

  protected

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale] ||= I18n.default_locale
  end

  def new_message
    @message = Message.new
  end

  def validate_referer
    if request.referer && URI(request.referer).host != request.host
      session[:refererral_user] = request.referer
    end
  end

end
