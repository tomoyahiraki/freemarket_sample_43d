# frozen_string_literal: true

class Deviseusers::RegistrationsController < Devise::RegistrationsController


  def new
    @users = User.new
  end

  def signinphonenumber
    @users = User.new
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:first_name] = params[:user][:first_name]
    session[:last_name] = params[:user][:last_name]
    session[:kana_first_name] = params[:user][:kana_first_name]
    session[:kana_last_name] = params[:user][:kana_last_name]
    session[:birth_year_id] = params[:user][:birth_year_id]
    session[:birth_month_id] = params[:user][:birth_month_id]
    session[:birth_day_id] = params[:user][:birth_day_id]
  end

  def signinlocation
    @user_address = UserAddress.new
    session[:telphone_number] = params[:user][:telphone_number]
  end

  def signincredit
    @users = User.new
    @user_address = UserAddress.new
    session[:postal_code] = params[:user_address][:postal_code]
    session[:area_id] = params[:user_address][:area_id]
    session[:city_name] = params[:user_address][:city_name]
    session[:city_number] = params[:user_address][:city_number]
    session[:building] = params[:user_address][:building]
  end

  def signincomplete
    # Userテーブル
    User.create!(nickname: session[:nickname], email: session[:email], password: session[:password], first_name: session[:first_name], last_name: session[:last_name], kana_first_name: session[:kana_first_name], kana_last_name: session[:kana_last_name], birth_year_id: session[:birth_year_id], birth_month_id: session[:birth_month_id], birth_day_id: session[:birth_day_id], telphone_number: session[:telphone_number], creditcard_id: params[:user][:creditcard_id])
    # UserAddressテーブル
    UserAddress.create!(postal_code: session[:postal_code], area_id: session[:area_id], city_name: session[:city_name], city_number: session[:city_number], building: session[:building])
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_year_id, :birth_month_id, :birth_day_id, :telphone_number, :postal_code, :area_id, :city_name, :city_number, :building, :creditcard_id)
  end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
