class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
    @product_prev_id = @product.id-1
    @product_prev = Product.where(id:@product_prev_id)
    @product_next_id = @product.id+1
    @product_next = Product.where(id:@product_next_id)
  end

  def buy_confirm
  end

end

    # @product_prev = Product.where('id >?', 0).where(id:@product_prev_id)
