class UserproductController < ApplicationController

  def show
    @product = Product.find(params[:product_id])
  end

  def stop
    @product = Product.find(params[:product_id])
    if @product.product_state_id == 1
      @product.update_attribute(:product_state_id, 3)
    elsif @product.product_state_id == 3
      @product.update_attribute(:product_state_id, 1)
    end
    redirect_to action: 'show'
  end

end
