Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'test#index'
  resources :products, only: [:index, :new] do
  end
end
