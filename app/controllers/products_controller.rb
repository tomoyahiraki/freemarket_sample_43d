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
    @favorites_count = Favorite.where(product_id: @product.id).count
  end

  def buy_confirm
  end

end
