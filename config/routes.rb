Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :new]
  resources :users, only: [:index] do
  	collection do
      get 'login'
    end
  end
end
