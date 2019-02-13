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

  def signininformation
  end

  def signinphonenumber
  end

  def signinlocation
  end

  def signincredit
  end

  def signincomplete
  end

end
