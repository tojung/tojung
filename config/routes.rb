Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  get 'home/about'
  
  devise_for :users, :controllers => { 
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  } 

end
