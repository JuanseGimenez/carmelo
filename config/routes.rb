Rails.application.routes.draw do
  root 'static_pages#home'
  mount ActionCable.server => '/cable'

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks",registrations: 'registrations' }
  devise_scope :user do
    get 'users/activation', :to => 'users#activation', :as => :activation_user
    post 'user/activate_account', :to => 'registrations#activate_account', :as => :activate_user
    post 'user/deactivate_account', :to => 'registrations#deactivate_account', :as => :deactivate_user
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, only: [:show , :index]

  get 'home'  =>  'dashboards#home'

  resources :trips do
    resources :car_segments
    resources :hotel_segments
    resources :event_segments
    collection do
      get 'search'
    end
  end

  resources :friendships do
    collection do
      put '/:id/confirm_friend' => 'friendships#confirm_friend', :as => 'confirm_friend'
      delete '/:id/cancel_friend' => 'friendships#cancel_friend', :as => 'cancel_friend'
    end
  end
  resources :searches, except: [:update, :create] do
    collection do
      post :search, to: 'searches#search'
    end
  end

  resources :relationships,       only: [:create, :destroy]
  resources :cars
  post '/', to: 'static_pages#register_from_home'

end