Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' 
  resources :tweets do
    resources  :comments, only: [:create]    
  end  
  get "home",to: "home#top"
  get "about",to: "home#about"
  get "users/index",to: "users#index"
  resources :users, only: [:show,:edit,:update] 
end
