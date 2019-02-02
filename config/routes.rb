Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:new, :show]
  resources :users, only: [:index, :edit, :update] do
  collection do
    get 'login'
    get 'logout'
  end
 end

end
