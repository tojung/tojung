class ProductLikeApiController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate_user_json!
  before_action :authenticate_user_json!

  def create
    action_service = ProductLikeService.new(params)
    action_service.create(user_id: custom_current_user.id)

    @like = action_service.likes(current_user: custom_current_user)
    @product = ProductService.new(params).product

    render json: { product_like: @like }
  end

  def update
    action_service = ProductLikeService.new(params)
    @product_like = action_service.update

    render json: { product_like: @product_like }
  end

  def last
    action_service = ProductLikeService.new(params)
    @product_like = action_service.likes(current_user: custom_current_user).last

    render json: { product_like: @product_like }
  end

  # private

  # def authenticate_user_json!
  #   render json: { 'error' => 'auth error' } if custom_current_user.nil?
  # end
end
