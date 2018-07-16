Rails.application.routes.draw do
  
  root 'home#index'

  get 'home/about'
  get 'home/policy'
  get 'home/privacy'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  get 'shop' => 'shopping#index'
  get 'shop/buy' => 'shopping#buy_form'
  post 'shop/buy' => 'shopping#buy'

    get 'disagree' => 'response#disagree'
  get 'agree' => 'response#agree'
  get '/discuss' => 'response#discuss'

  get 'propose/new' => 'propose#new', as: "propose_new"
  post 'propose' => 'propose#create'
  get 'propose/edit/:id' => 'propose#edit'
  patch 'propose/:id' => 'propose#update'
  get 'propose/:id' => 'propose#detail'
  
  get 'propose/:id/subscribe' => 'propose#subscribe_form'
  post 'propose/:id/subscribe' => 'propose#subscribe'
  
  post 'propose/:id/email/:person_id' => 'propose#email_send'
  get 'propose/:id/email/:person_id' => 'propose#email_form'


  devise_for :vusers, controllers: {
      sessions: 'vuser/sessions',
      registrations: 'vuser/registrations',
	  omniauth_callbacks: 'vuser/omniauth_callbacks'
  }
  
end
