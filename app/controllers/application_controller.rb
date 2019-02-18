class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_current_user
  before_action :category
  protect_from_forgery with: :exception

# デバイス用
  before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :telphone_number, :birth_year_id, :birth_month_id, :birth_day_id, :postal_code, :area_id, :city_name, :city_number, :building, :token_id, :customer_id, :proceed, :provider, :uid])
    end

  private
# basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def category
    @categories = Category.all
  end

end
