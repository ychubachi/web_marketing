WebMarketing::Application.routes.draw do
  get "view/index"

  resources :views do as_routes end

  resources :views

  resources :submits do as_routes end
  resources :submits
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

  get "redirection/index"
  get "redirection/redirect"
  match '/rd/:code' => 'redirection#redirect'
  root to: "redirection#index"

  get 'home/index'
  authenticated :user do
    root :to => 'home#index'
  end
  # root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
