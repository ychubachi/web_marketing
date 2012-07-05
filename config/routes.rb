WebMarketing::Application.routes.draw do
  get  'home/index'
  get  'home/redirect'
  post 'home/page'
  get  'home/javascript'

  match '/rd/:code' => 'home#redirect'
  match '/pv'       => 'home#page'
  match '/tracker'  => 'home#javascript'
  match '/lp'           => 'landing/page#index'
  match '/lp/thank_you' => 'landing/page#thank_you'
  match '/lp/sorry'     => 'landing/page#sorry'
  match '/admin'    => 'admin/users#index'

  namespace :landing do
    resources :page, :only => [:index, :create]
    get 'page/thank_you'
    get 'page/sorry'
  end

  namespace :admin do
    resources :customers do as_routes end
    resources :pages do as_routes end
    resources :requests do as_routes end
    resources :actions do as_routes end
    resources :redirections do as_routes end
    resources :targets do as_routes end
    resources :media do as_routes end
    resources :browsers do as_routes end
    # followings will be deleted?
    resources :pages
    resources :requests
    resources :actions
    resources :redirections
    resources :targets
    resources :media
    resources :browsers
    resources :users, :only => [:show, :index]
  end
  
  devise_for :users

  root to: "home#index"

  authenticated :user do
    root :to => 'admin/users#index'
  end
end
