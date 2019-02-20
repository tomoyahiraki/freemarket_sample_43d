class UsersController < ApplicationController

before_action :authenticate_user!, except: [:create, :signininformation, :signinphonenumber, :signinlocation, :signincredit, :signincomplete]
require "payjp"

  def index
    @users = User.find(current_user.id)
  end

  def edit
  end

  def profile
  end

  def login
  end

  def logout
  end

  def login
  end

  def logout
  end

  def create
    if env['omniauth.auth'].present?
        # Facebookログイン
        @user  = User.from_omniauth(env['omniauth.auth'])
        result = @user.save(context: :facebook_login)
        fb       = "Facebook"
    else
        # 通常サインアップ
        @user  = User.new(strong_params)
        result = @user.save
        fb       = ""
    end
    if result
        sign_in @user
        flash[:success] = "#{fb}ログインしました。"
        redirect_to @user
    else
        if fb.present?
            redirect_to auth_failure_path
        else
            render 'new'
        end
    end
  end


  def show
    @users = User.find(current_user.id)
    @token = @users.token_id
    Payjp.api_key = PAYJP_SECRET_KEY
    if @token.present?
      @cards = Payjp::Token.retrieve(@token)
    end
  end

  def delete
    @users = User.find(current_user.id)
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Customer.retrieve(@users.customer_id)
    customer.delete
    @users.update_attributes(token_id: nil, customer_id: nil)
    redirect_to :back
  end

  def purchase
  end

  def save
    @users = User.where(id: current_user.id)
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Customer.create(card: params[:payjp_token])
    @users.update_all(token_id: params[:payjp_token], customer_id: customer.id)
    redirect_to users_path, notice: "クレジットカード情報を登録しました。"
  end

  def lists
    @selllists = Product.where(user_id:current_user.id)
  end


  def new
  end

  def signininformation
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
    @users = User.new
    session[:telphone_number] = params[:user][:telphone_number]
  end

  def signincredit
    session[:postal_code] = params[:user][:postal_code]
    session[:area_id] = params[:user][:area_id]
    session[:city_name] = params[:user][:city_name]
    session[:city_number] = params[:user][:city_number]
    session[:building] = params[:user][:building]
    @users = User.new(nickname: session[:nickname], email: session[:email], password: session[:password], first_name: session[:first_name], last_name: session[:last_name], kana_first_name: session[:kana_first_name], kana_last_name: session[:kana_last_name], birth_year_id: session[:birth_year_id], birth_month_id: session[:birth_month_id], birth_day_id: session[:birth_day_id], telphone_number: session[:telphone_number], postal_code: session[:postal_code], area_id: session[:area_id], city_name: session[:city_name], city_number: session[:city_number], building: session[:building])
  end

  def signincomplete
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_year_id, :birth_month_id, :birth_day_id, :telphone_number, :postal_code, :area_id, :city_name, :city_number, :building, :customer_id, :provider, :uid)
  end

end
