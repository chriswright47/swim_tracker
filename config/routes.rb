Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'meets#index'

  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]

  resources :athletes
  resources :meets, :except => [:edit, :update] do
    member do
      get 'pdf'
    end
  end
  resources :heats, :only => [:show, :update]
end
