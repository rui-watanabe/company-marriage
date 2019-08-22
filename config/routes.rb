Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' 
  
  get "home",to: "home#top"
  get "about",to: "home#about"
end
