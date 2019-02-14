Rails.application.routes.draw do

  devise_for :users
  root 'products#index'

  resources :products, only: [:new, :show, :destroy] do
    collection do
      get 'buy_confirm'
      get 'search'
    end
  end

  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'purchase'
      get 'login'
      get 'logout'
      get 'password_less'
      get 'lists'
# (仮置き)
      get 'signininformation'
      get 'signinphonenumber'
      get 'signinlocation'
      get 'signincredit'
      get 'signincomplete'
    end
  end

  get "userproduct/:product_id/show" => "userproduct#show"

  post "favorites/:product_id/create" => "favorites#create"
  post "favorites/:product_id/destroy" => "favorites#destroy"

end
