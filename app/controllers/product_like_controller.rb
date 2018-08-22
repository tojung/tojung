class ProductLikeController < ApplicationController
  before_action :authenticate_user!
  def create
    ProductLike.create(user_id: current_user.id,
                           product_id: Product.find(params[:product_id]).id,
                       status: true)

    redirect_to "/product/#{params[:product_id]}"
  end

  def update
    product_like = ProductLike.find(params[:product_like_id])
    product_like.update(status: !product_like.status)

    redirect_to "/product/#{params[:product_id]}"
  end
end
