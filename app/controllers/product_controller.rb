class ProductController < ApplicationController
  def show
    set_data
    render :detail
    # @product
    # render json: {
    #
    # }
    # render json: @product, :include => [:product_timelines,
    #                                    :maker_responses=>{:include=>[:maker]},
    #                                    :product_options,
    #                                    :packages]
  end


  private

  def set_data
    product_service = ProductService.new(params)
    product_infos = product_service.infos

    @product = product_infos[:product]
    @product_options = product_infos[:product_options]
    @maker_responses = product_infos[:maker_responses]
    @product_caros = product_infos[:product_caros]

    @like = ProductLikeService.new(params).likes(current_user: current_user)
  end
end
