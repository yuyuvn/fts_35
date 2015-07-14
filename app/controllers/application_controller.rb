class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  add_flash_types :success, :danger, :info

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for :sign_up do |u|
      u.permit :name, :email, :password, :password_confirmation
    end
    devise_parameter_sanitizer.for :account_update do |u|
      u.permit :name, :email, :password, :password_confirmation,
        :current_password
    end
  end
end
