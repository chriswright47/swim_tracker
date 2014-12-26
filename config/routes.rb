Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :athletes, :except => [:new, :edit]
      resources :meets, :except => [:new, :edit] do
        resources :heats, :only => [:edit, :show, :index]
      end
      resources :events, :only => [:index, :show]
    end
  end


  get '*path', :to => 'welcome#index'
end
