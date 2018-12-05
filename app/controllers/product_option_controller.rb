class ProductOptionController < ApplicationController
  def show
    find_product_option
  end
  private

  def find_product_option
    @product_option = ProductOption.find(params[:product_option_id])
  end
end