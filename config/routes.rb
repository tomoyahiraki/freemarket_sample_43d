Rails.application.routes.draw do

  devise_for :users
  root 'products#index'
  resources :products, only: [:new, :show] do
    collection do
      get 'buy_confirm'
    end
  end

  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'purchase'
      get 'login'
      get 'logout'
      get 'password_less'
# (仮置き)
      get 'signininformation'
      get 'signinphonenumber'
      get 'signinlocation'
      get 'signincredit'
      get 'signincomplete'
    end
  end

end





