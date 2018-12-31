class ProductOptionController < ApplicationController
  def show
    @product_option = ProductOption.find(params[:product_option_id])
  end
end