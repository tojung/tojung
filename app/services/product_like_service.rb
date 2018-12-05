class ProductLikeService
  def initialize(params)
    @product_id = params[:product_id]
    @product_like_id = params[:product_like_id]
  end

  def likes(current_user:)
    return nil unless current_user
    @like = ProductLike.where(user_id: current_user.id, product_id: @product_id)
  end

  def create(user_id:)
    ProductLike.create(user_id: user_id,
                       product_id: @product_id,
                       status: true)
  end

  def update
    product_like = ProductLike.find(@product_like_id)
    product_like.update(status: !product_like.status)
    product_like.status
  end
end
