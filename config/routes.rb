Rails.application.routes.draw do

    devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }

  root 'products#index'

  resources :products do
    collection do
      get ':id/buy_confirm' => 'products#buy_confirm'
      patch ':id/buy' => 'products#buy'
      get 'search'
      get '_topheader'
      get ':id/category' => 'products#category'
      get 'brand_search'
      get 'category_search'
      get 'category_index'
      get 'size_search'
    end
  end

  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'profile'
      get 'purchase'
      patch 'purchase' => 'users#save'
      delete ':id' => 'users#delete'
      get 'login'
      get 'logout'
      get 'password_less'
      get 'lists'

      get 'signininformation'
      post 'signinphonenumber'
      post 'signinlocation'
      post 'signincredit'
      post 'signincomplete'

    end
  end

  get "userproduct/:product_id/show" => "userproduct#show"
  patch 'userproduct/:product_id' => 'userproduct#stop'

  post "favorites/:product_id/create" => "favorites#create"
  post "favorites/:product_id/destroy" => "favorites#destroy"

end
