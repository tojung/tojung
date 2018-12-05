Rails.application.routes.draw do
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

  root 'home#index'
  get 'home/index'
  get 'home/about'
  get 'home/brand'
  get 'home/search' => 'home#search', as: 'search'
  get 'home/policy'
  get 'home/privacy'
  get 'home/mypage'
  get 'home/myorder'
  get 'home/guestorder'
  get 'home/guestorderinfo'

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

  # authenticate(:user, lambda do |u|
  #   u.admin
  # end) do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  # post '/push' => 'notifications#push'
  # post '/message' => 'notifications#message'
  # match '/404', to: 'errors#not_found', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all
  # get 'product/ready/:product_id' => 'product#detail_ready'

  # resources :mainimage
  # resources :package, param: :package_id
  # post 'package/:package_id/options' => 'package#opt_to_package'

  # get 'product_option/:product_option_id/detail' => 'product_option#detail'
end
