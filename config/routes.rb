Rails.application.routes.draw do

  devise_for :users

  root 'products#index'

  resources :products, only: [:new, :show, :destroy, :create] do
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

      get 'signininformation'
      post 'signinphonenumber'
      post 'signinlocation'
      post 'signincredit'

    end
  end

  get "userproduct/:product_id/show" => "userproduct#show"

  post "favorites/:product_id/create" => "favorites#create"
  post "favorites/:product_id/destroy" => "favorites#destroy"

end
