class ProductLikeService
  def initialize(params)
    @product_id = params[:product_id]
  end

  def likes(current_user:)
    # @like = ProductLike.where(user_id: @current_user_id, product_id: @product_id)
    # retrun nil unless user_signed_in?
    puts current_user
    return nil unless current_user
    @like = ProductLike.where(user_id: current_user.id, product_id: @product_id)
  end
end
