class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_current_user
  protect_from_forgery with: :exception

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
