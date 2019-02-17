class UsersController < ApplicationController

  def index
  end

  def edit
  end

  def update
  end

  def login
  end

  def logout
  end

  def show
  end

  def login
  end

  def logout
  end

  def purchase
  end

  def lists
    @selllists = Product.where(user_id:"1")
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
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_year_id, :birth_month_id, :birth_day_id, :telphone_number, :postal_code, :area_id, :city_name, :city_number, :building, :creditcard_id)
  end

end
