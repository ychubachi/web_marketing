WebMarketing::Application.routes.draw do
  match '/rd/:code'         => 'home#redirect'
  match '/pv'               => 'home#page_view'
  match '/tracker'          => 'home#tracker'
  match '/admin'            => 'admin/users#index'
  match '/lp'               => 'landing/page#index'
  match '/lp/pm'            => 'landing/page#pm'
  match '/lp/thank_you'     => 'landing/page#thank_you'
  match '/lp/sorry'         => 'landing/page#sorry'
  match '/lp/display/:file' => 'landing/page#display'

  namespace :landing do
    resources :page, :only => [:create]
  end

  namespace :admin do
    resources :conversions do as_routes end
    resources :page_views do as_routes end
    resources :customers do as_routes end
    resources :pages do as_routes end
    resources :requests do as_routes end
    resources :actions do as_routes end
    resources :redirections do as_routes end
    resources :targets do as_routes end
    resources :media do as_routes end
    resources :browsers do as_routes end
  end
  
  devise_for :users#, skip: [:registrations, :confirmations] # only: [:sign_in, :sign_out, :edit, :session]
  namespace :users do
    resources :users, :only => [:show, :index]
  end
  authenticated :user do
    root :to => 'users/users#index'
  end

  root to: "home#index"
end
