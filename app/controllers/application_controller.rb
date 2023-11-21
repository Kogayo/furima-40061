class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kogayou' && password == '1202'
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :birth_day, :first_name, :last_name, :read_first, :read_last])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :birth_day, :first_name, :last_name, :read_first, :read_last])
  end

end
