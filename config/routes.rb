Rails.application.routes.draw do
  require 'sidekiq/web'
  
  root 'home#index'

  get 'home/index'
  get 'home/about'
  
  get 'additional_info' => 'userupdaters#additional'
  post 'additional_update' => 'userupdaters#additional_update'

  devise_for :users, :controllers => { 
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  } 
  
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
