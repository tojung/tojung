class PackageController < ApplicationController
  before_action :redirect_root_without_admin, :find_options_and_product

  # GET '/product/:product_id/package/new'
  def new; end

  # POST '/product/:product_id/package/create'
  def create; end

  private
  def find_options_and_product
    @product = Product.find(params[:product_id])
    @product_options = @product.product_options
  end
end
