WebMarketing::Application.routes.draw do
  resources :pages do as_routes end

  resources :pages

  resources :requests do as_routes end
  resources :requests
  resources :actions do as_routes end
  resources :actions
  resources :convertions do as_routes end
  resources :convertions
  resources :redirections do as_routes end
  resources :redirections
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

  get "view/index"

  #
  get 'home/index'
  authenticated :user do
    root :to => 'home#index'
  end
  # root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
