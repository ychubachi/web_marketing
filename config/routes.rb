WebMarketing::Application.routes.draw do
  get "redirector/index"
  get "redirector/redirect"
  match '/rd/:code' => 'redirector#redirect'
  root to: "redirector#index"

  resources :requests do as_routes end
  resources :requests
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

  get 'home/index'
  authenticated :user do
    root :to => 'home#index'
  end
  # root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
