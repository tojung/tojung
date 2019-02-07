class ProductLikeApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_json!

  def create
    action_service = ProductLikeService.new(params)
    action_service.create(user_id: current_user.id)

    @like = action_service.likes(current_user: current_user)
    @product = ProductService.new(params).product

    render json: { product_like: @like }
  end

  def update
    action_service = ProductLikeService.new(params)
    @product_like = action_service.update

    render json: { product_like: @like }
  end

  private

  def authenticate_user_json!
    unless current_user
      render json: { 'error' => 'authentication error' }, status: 401
    end
  end
end
