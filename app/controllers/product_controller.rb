class ProductController < ApplicationController
  def show
    set_data
    check_admin
    is_liked
    render :detail
  end

  private

  def is_liked
    @like = ProductLikeService.new(params).likes(current_user: current_user)
  end

  def set_data
    product_service = ProductService.new(params)
    product_infos = product_service.infos

    @product = product_infos[:product]
    @product_options = product_infos[:product_options]
    @maker_responses = product_infos[:maker_responses]
    @product_caros = product_infos[:product_caros]
  end
end
