class ProductsController < ApplicationController

before_action :authenticate_user!, except: [:index]
protect_from_forgery except: [:buy_confirm, :buy]

  def index
    @ladys = Product.where(category_id:"1").order('id DESC').limit(4)
    @mens = Product.where(category_id:"2").order('id DESC').limit(4)
    @kids = Product.where(category_id:"3").order('id DESC').limit(4)
    @cosme = Product.where(category_id:"4").order('id DESC').limit(4)
    @chanel = Product.where(brand_id:"556").order('id DESC').limit(4)
    @lvmh = Product.where(brand_id:"1434").order('id DESC').limit(4)
    @burberry = Product.where(brand_id:"957").order('id DESC').limit(4)
    @gucci = Product.where(brand_id:"437").order('id DESC').limit(4)
  end

  def new
    @products = Product.new
    @products.images.new
    @categories = Category.all
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

  def edit
    @products = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user.id == current_user.id
      @product.update(products_params)
    end
    # binding.pry
    redirect_to controller: 'userproduct', action: 'show', product_id: params[:id]
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
    logger.debug @products.errors.inspect
    redirect_to action: 'index'
  end

  def category
    @products = Product.where(category_id: "#{params[:id]}")
    @categories = Category.all
  end

  def brand_search
    @brands = Brand.where('name LIKE(?)', "#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

  def category_search
    @categories = Category.where(parent_id: "#{params[:id]}")
    respond_to do |format|
      format.json
    end
  end

  def size_search
    @sizes = Size.where(category_size_id: "#{params[:id]}")
    # binding.pry
    respond_to do |format|
      format.json
    end
  end

  private

    def products_params
       params.require(:product).permit(:product_state_id,:brand_id,:title, :product_old_id, :deliveryfee_id, :area_id, :price, :product_introduce, :shipment_id, :size_id, :category_id, :deliveryday_id, images_attributes:[:image]).merge(user_id: current_user.id)
    end

end
