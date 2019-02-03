class ProductApiController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    res = ProductSerializerService.new(params).product_more
    render json: {
      "product": res
    }
  end

  def index
    res = ProductSerializerService.new(params).products
    render json: {
      "products": res
    }
  end
end
