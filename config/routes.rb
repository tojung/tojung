Rails.application.routes.draw do
  require 'sidekiq/web'

  root 'home#index'

  get 'home/index'
  get 'home/about'

  get 'additional_info' => 'userupdaters#additional'
  post 'additional_update' => 'userupdaters#additional_update'

  get 'mainimage/new'
  post 'mainimage/create'

  get 'product/new'
  post 'product/create'

  get 'product/:product_id' => 'product#detail'
  get 'product/ready/:product_id' => 'product#detail_ready'

  post 'product/update/:product_id' => 'product_updater#update'
  get 'product/edit/:product_id' => 'product_updater#edit'

  get 'product/image0/:product_id' => 'product_updater#imagedit'
  post 'product/image0/:product_id' => 'product_updater#update_image0'

  get 'product/image1/:product_id' => 'product_updater#imagedit2'
  post 'product/image1/:product_id' => 'product_updater#update_image1'

  get 'product/visible/:product_id' => 'product_updater#set_visible'

  get 'product/:product_id/new_option' => 'product_option#new'
  post 'product/:product_id/create_option' => 'product_option#create'

  get 'product_options/:product_option_id/edit' => 'product_option#edit'
  post 'product_options/:product_option_id/update' => 'product_option#update'

  get 'product/:product_id/package/new' => 'package#new'
  post 'product/:product_id/package/create' => 'package#create'

  devise_for :users, controllers: {
    omniauth_callbacks: 'user/omniauth_callbacks',
    registrations: 'user/registrations'
  }

  authenticate(:user, ->(u) do
    u.admin
  end) do
    mount Sidekiq::Web => '/sidekiq'
  end
end
