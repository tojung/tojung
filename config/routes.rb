Rails.application.routes.draw do
  
  root 'home#index'

  get 'home/index'
  get 'home/about'
  
  get 'additional_info' => 'userupdaters#additional'
  post 'additional_update' => 'userupdaters#additional_update'

  devise_for :users, :controllers => { 
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  } 

end
