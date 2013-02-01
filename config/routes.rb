WebMarketing::Application.routes.draw do
  match '/rd/:code'         => 'redirectors#redirect'
  match '/pv'               => 'redirectors#page_view'
  match '/tracker'          => 'redirectors#tracker'
  match '/lp'               => 'pages#new'
  match '/lp/pm'            => 'pages#pm'
  match '/admin'            => 'admin/users#index'

  resource :page, :only => [:new, :create] do
    member do
      get 'thank_you'
      get 'sorry'
      get 'pm'
    end
  end

  resource :form, only: [:new, :create] do
    member do
      get 'thank_you'
      get 'sorry'
    end
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
  
  devise_for :users, only: [:sessions] #[:sessions, :registrations]
  namespace :users do
    resources :users, :only => [:show, :index]
  end
  authenticated :user do
    root :to => 'users/users#index'
  end

  root to: "redirectors#index"
end
