class ProductApiController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    res = ProductSerializerService.new(params)
                                  .product_more
    res['user_id'] = user_info[:user_id]
    res['is_product_like'] = false
    res['like_id'] = -1
    product_like = current_user.product_likes.find_by_product_id(res['id'])
    res['is_product_like'] = product_like.status unless product_like.nil?
    res['like_id'] = product_like.id unless product_like.nil?

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
    user_id = current_user.id if user_signed_in?
    {
      "user_id": user_id
    }
  end
end
