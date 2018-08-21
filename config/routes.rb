Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # require 'sidekiq/web'

  root 'home#index'
  get 'home/index'
  get 'home/about'
  get 'home/brand'
  get 'categorize/:category_id' => 'home#categorize'
  get 'side_cate/:id' => 'home#sidebar_categorize'

  get 'home/policy'
  get 'home/privacy'
  get 'home/mypage'
  get 'additional_info' => 'userupdaters#additional'
  post 'additional_update' => 'userupdaters#additional_update'

  resources :mainimage

  resources :product, param: :product_id
  get 'product/ready/:product_id' => 'product#detail_ready'

  resources :package, param: :package_id
  post 'package/:package_id/options' => 'package#opt_to_package'

  resources :product_option, param: :product_option_id
  resources :maker, param: :maker_response_id
  get 'product_option/:product_option_id/detail' => 'product_option#detail'

  post 'maker/:maker_response_id/send_mail' => 'maker#send_mail'

  get 'agree' => 'response#agree'
  get 'disagree' => 'response#disagree'
  post 'discuss' => 'response#discuss'

  resources :product_order, param: :product_order_id

  devise_for :users, controllers: {
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  }
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  # authenticate(:user, lambda do |u|
  #   u.admin
  # end) do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
end
