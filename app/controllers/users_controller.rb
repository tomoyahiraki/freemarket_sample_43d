class UsersController < ApplicationController

# before_action :move_to_index, except: :index

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


  def signininformation
    @users = User.new
  end

  def signinphonenumber
    binding.pry
    @users = User.new
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:first_name] = params[:user][:first_name]
    session[:last_name] = params[:user][:last_name]
    session[:kana_name] = params[:user][:kana_name]
    session[:birth_year_id] = params[:user][:birth_year_id]
    session[:birth_month_id] = params[:user][:birth_month_id]
    session[:birth_day_id] = params[:user][:birth_day_id]
  end

  def signinlocation
    binding.pry
    @user_address = UserAddress.new
    session[:telphone_number] = params[:user][:telphone_number]
  end

  def signincredit
    binding.pry
    @user_address = UserAddress.new
    session[:postal_code] = params[:user_address][:postal_code]
    session[:area_id] = params[:user_address][:area_id]
    session[:city_name] = params[:user_address][:city_name]
    session[:city_number] = params[:user_address][:city_number]
    session[:building] = params[:user_address][:building]
  end

  def signincomplete
    binding.pry
    # Userテーブル
    User.create(nickname: session[:nickname], email: session[:email], password: session[:password], first_name: session[:first_name], last_name: session[:last_name], kana_first_name: session[:kana_first_name], kana_last_name: session[:kana_last_name], birth_year_id: session[:birth_year_id], birth_month_id: session[:birth_month_id], birth_day_id: session[:birth_day_id], telphone_number: session[:telphone_number])
    # UserAddressテーブル
    UserAddress.create(postal_code: session[:postal_code], area_id: session[:area_id], city_name: session[:city_name], city_number: session[:city_number], building: session[:building])
  end
  # private

  #    def move_to_index
  #     redirect_to action: :index unless user_signed_in?
  #   end

end
