WebMarketing::Application.routes.draw do
  resources :actions do as_routes end

  resources :actions

  resources :convertions do as_routes end

  resources :convertions

  resources :redirects do as_routes end

  resources :redirects

  resources :targets do as_routes end

  resources :targets

  resources :media do as_routes end

  resources :media

  resources :browsers do as_routes end

  resources :browsers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
