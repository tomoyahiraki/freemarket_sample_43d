class ProductsController < ApplicationController

before_action :authenticate_user!, except: [:index]

  def index
    @ladys = Product.where(category_id:"1").order('id DESC').limit(4)
    @mens = Product.where(category_id:"2").order('id DESC').limit(4)
    @kids = Product.where(category_id:"3").order('id DESC').limit(4)
    @cosme = Product.where(category_id:"4").order('id DESC').limit(4)
  end

  def new
    @products = Product.new
    @products.images.new
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
    @product = Product.find(params[:id])
    @user = User.find(current_user.id)
    @token = @user.token_id
    if @token.present?
      Payjp.api_key = PAYJP_SECRET_KEY
      @cards = Payjp::Token.retrieve(@token)
    end
  end

  def buy
    @product = Product.find(params[:id])
    @user = User.find(current_user.id)
    Payjp.api_key = PAYJP_SECRET_KEY
    charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @user.customer_id,
    currency: 'jpy',
    )
    @product.update(product_state_id: 2)
    redirect_to action: 'index'
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%")
  end

  def create
    @products = Product.create(products_params)
    redirect_to action: 'index'
  end

<<<<<<< HEAD
  def category
    @products = Product.where(category_id: "#{params[:id]}")
    @categories = Category.all
=======
  def brand_search
    @brands = Brand.where('name LIKE(?)', "#{params[:keyword]}%")
    # binding.pry
    respond_to do |format|
      format.json
    end
>>>>>>> nagomuohta/master
  end

  private

    def products_params
       params.require(:product).permit(:product_state_id, :title, :product_old_id, :deliveryfee_id, :area_id, :price, :product_introduce, :shipment_id, :user_id, :brand_id, :size_id, :category_id, :deliveryday_id, images_attributes:[:image_url])
    end



end
