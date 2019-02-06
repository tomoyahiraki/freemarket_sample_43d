class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @product = Product.find(1)
    # @product = Product.find(params[:id])
  end

  def buy_confirm
  end

end
