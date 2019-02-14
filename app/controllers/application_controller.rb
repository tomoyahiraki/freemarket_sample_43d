class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception

# デバイス用
  before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :telephone_number, :birth_year_id, :birth_month_id, :birth_day_id, :postal_code, :area_id, :city_name, :city_number, :building, :creditcard_id, :proceed, :provider, :uid])
    end

  private
# basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
