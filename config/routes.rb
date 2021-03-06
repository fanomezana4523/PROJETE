Rails.application.routes.draw do
  get 'emails/index'
  devise_for :users
  resources :emails
  root to: "home#index"
  get "emails/index"
  resources :tasks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
