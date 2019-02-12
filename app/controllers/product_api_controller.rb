class ProductApiController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    res = ProductSerializerService.new(params)
                                  .product_more
    res['user_id'] = user_info[:user_id]
    product_like = ProductLikeService.new(params).likes(current_user: User.find(user_info[:user_id])).last
    res['like_id'] = product_like.id unless product_like.nil?
    res['is_product_like'] = product_like.status unless product_like.nil?
    render json: {
      product: res
    }
  end

  def index
    res = ProductSerializerService.new(params).products
    render json: {
      "products": res
    }
  end

  private

  def user_info
    # user_id = cuif user_signed_in?
    user_id = -1
    user_id = custom_current_user.id unless custom_current_user.nil?
    {
      "user_id": user_id
    }
  end
end
