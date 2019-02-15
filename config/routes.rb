Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions:      'deviseusers/sessions',
  registrations: 'deviseusers/registrations'
}
  devise_scope :user do
  get '/deviseusers/registrations/new', to: 'deviseusers_registrations#signinphonenumber'

  get      '/deviseusers/registrations/new' => 'registrations#new'
  post     '/deviseusers/registrations/signinphonenumber' => 'deviseusers/registrations#signinphonenumber'
  post     '/deviseusers/registrations/signinlocation'    => 'deviseusers/registrations#signinlocation'
  post     '/deviseusers/registrations/signincredit'      => 'deviseusers/registrations#signincredit'
  post     '/deviseusers/registrations/signincomplete'    => 'deviseusers/registrations#signincomplete'
end

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
    end
  end

  get "userproduct/:product_id/show" => "userproduct#show"

  post "favorites/:product_id/create" => "favorites#create"
  post "favorites/:product_id/destroy" => "favorites#destroy"

end
