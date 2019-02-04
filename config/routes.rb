Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:new, :show]
  resources :users, only: [:index, :edit, :update, :show] do
    collection do
      get 'purchase'
    end
  end
end
