class ProductOptionController < ApplicationController
  before_action :redirect_root_except_admin
  before_action :find_product, only: %i[new create]
  before_action :find_product_option, only: %i[edit update]
  # after_action :redirect_ready_page, only: %i[update create]
  # GET '/product/:product_id/new_option'
  def new; end

  # GET '/product_options/:product_option_id/edit'
  def edit; end

  # POST '/product_options/:product_option_id/update'
  def update
    @product_option.updateOption(product_options_params)
    redirect_ready_page
  end

  # POST '/product/:product_id/create_option'
  def create
    @product.createProductOption(product_options_params)
    redirect_ready_page
  end

  private

  def redirect_ready_page
    product_id = @product.nil? ? @product_option.product.id.to_s : @product.id.to_s
    redirect_to "/product/ready/#{product_id}"
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_product_option
    @product_option = ProductOption.find(params[:product_option_id])
  end

  def product_options_params
    params.permit(
      :name, :content,
      :price, :remain_count, :image0,
      :status, :image1
    )
  end
end
