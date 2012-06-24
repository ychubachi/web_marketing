WebMarketing::Application.routes.draw do
  resources :pages do as_routes end
  resources :pages
  resources :requests do as_routes end
  resources :requests
  resources :actions do as_routes end
  resources :actions
  resources :redirections do as_routes end
  resources :redirections
  resources :targets do as_routes end
  resources :targets
  resources :media do as_routes end
  resources :media
  resources :browsers do as_routes end
  resources :browsers

  get  'home/index'
  get  'home/admin'
  get  'home/redirect'
  post 'home/page'

  match '/rd/:code' => 'home#redirect'
  match '/pv'      => 'home#page'
  match '/admin/'   => 'home#admin'

  root to: "home#index"

#  authenticated :user do
#    root :to => 'home#admin'
#  end
  devise_for :users
  resources :users, :only => [:show, :index]
end
