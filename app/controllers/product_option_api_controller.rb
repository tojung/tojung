class ProductOptionApiController < ApplicationController
  def show
    res = ProductOptionSerializerService.new(params).product_option
    render json: {
      product_option: res
    }
  end
end
