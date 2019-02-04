Rails.application.routes.draw do

  root 'products#index'
<<<<<<< HEAD
  resources :products, only: [:new, :show]
  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'purchase'
      get 'login'
      get 'logout'
    end
  end
=======
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
    end
  end

>>>>>>> nagomuohta/master
end
