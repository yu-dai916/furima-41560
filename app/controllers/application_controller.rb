class ApplicationController < ActionController::Base
  before_action :basic_auth,:configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:firstname_katakana, :lastname_katakana, :firstname,:lastname, :birth_day])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
