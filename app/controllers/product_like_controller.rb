class ProductLikeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    action_service = ProductLikeService.new(params)
    action_service.create(user_id: current_user.id)

    @like = action_service.likes(current_user: current_user)
    @product = ProductService.new(params).product

    respond_to do |format|
      format.js { render locals: { like: @like } }
    end
  end

  def update
    action_service = ProductLikeService.new(params)
    @product_like = action_service.update
  end
end
