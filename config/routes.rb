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

  get 'home/index'
  get "home/redirect"
  get 'home/admin'
  match '/rd/:code' => 'home#redirect'
  match '/admin/'   => 'home#admin'
  root to: "home#index"

#  authenticated :user do
#    root :to => 'home#admin'
#  end
  devise_for :users
  resources :users, :only => [:show, :index]
end
