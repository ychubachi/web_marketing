WebMarketing::Application.routes.draw do
  namespace :landing do
    get "page/index"
  end

  get  'home/index'
  get  'home/admin'
  get  'home/redirect'
  post 'home/page'
  get  'home/javascript'

  match '/rd/:code' => 'home#redirect'
  match '/pv'      => 'home#page'
  match '/js'      => 'home#javascript'
  match '/admin/'   => 'admin/users#index'

  namespace :admin do
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
    resources :users, :only => [:show, :index]
  end
  devise_for :users

  root to: "home#index"

  authenticated :user do
    root :to => 'admin/users#index'
  end
end
