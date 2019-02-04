Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create]
  resources :users, only: [:index, :edit]
=======
  root 'products#index'
  resources :products, only: [:new, :show]
  resources :users, only: [:index, :edit, :update] do
  collection do
    get 'login'
    get 'logout'
  end
 end

>>>>>>> nagomuohta/master
end
