class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, product_id: params[:product_id])
    @favorite.save
    redirect_to("/products/#{params[:product_id]}")
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, product_id: params[:product_id])
    @favorite.destroy
    redirect_to("/products/#{params[:product_id]}")
  end

end
