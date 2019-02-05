Rails.application.routes.draw do

  root 'products#index'
  resources :products, only: [:new, :show] do
    collection do
      get 'buy_confirm'
    end
  end

  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'login'
      get 'logout'
      get 'password_less'
      get 'signinone'
      get 'signintwo'
      get 'signinthree'

    end
  end

end
