Rails.application.routes.draw do
  get 'bill_comments/create'

  get 'bill_comments/destroy'

  get 'bill_comments/update'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  }

  ActiveAdmin.routes(self)

  resources :userupdaters
  resources :product, param: :product_id
  resources :product_option, param: :product_option_id
  resources :maker, param: :maker_response_id
  resources :product_like, param: :product_like_id
  resources :payment
  resources :product_order, param: :product_order_id
  resources :bill_comments

  root 'home#index'

  get 'home/index'
  get 'home/about'
  get 'home/brand'
  get 'home/search' => 'home#search', as: 'search'
  get 'home/policy'
  get 'home/privacy'
  get 'home/mypage'
  get 'home/myorder'

  get 'order_info' => 'order_info#new'
  post 'order_info' => 'order_info#show'

  get 'categorize/:category_id' => 'home#categorize'
  get 'side_cate/:id' => 'home#sidebar_categorize'

  get 'additional_info' => 'userupdaters#additional'
  post 'additional_update' => 'userupdaters#additional_update'

  post 'maker/:maker_response_id/send_mail' => 'maker#send_mail'
  get 'agree' => 'response#agree'
  get 'disagree' => 'response#disagree'
  post 'discuss' => 'response#discuss'

  post '/toss' => 'payment#toss'
  get '/toss/complete' => 'payment#toss_complete'

  get '/best/:id' => 'home#best'
  post '/push' => 'notifications#push'

  get 'maker/send'
  get 'home/send'
  get 'home/maker_opinion'
end
