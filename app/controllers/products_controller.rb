class ProductsController < ApplicationController

  def index
    @ladys = Product.where(category_id:"1").order('id DESC').limit(4)
    @mens = Product.where(category_id:"2").order('id DESC').limit(4)
    @kids = Product.where(category_id:"3").order('id DESC').limit(4)
    @cosme = Product.where(category_id:"4").order('id DESC').limit(4)
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
    @userid = @product.user_id
    @useritem = Product.where(user_id:"#{@userid}").order('id DESC').limit(6)
  end

  def destroy
    @userproduct = Product.find(params[:id])
    @userproduct.destroy
    redirect_to action: 'index'
  end

  def buy_confirm
  end

end
