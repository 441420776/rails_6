Rails.application.routes.draw do
  use_doorkeeper  do
      controllers applications: 'oauth/applications'
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }
  mount Test::BaseApi => '/'
  mount Tb::BaseApi => '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get '/docs/index', to: 'docs#index'
  resources :homes

  resources :packages do
    get :download, on: :collection
  end

end
