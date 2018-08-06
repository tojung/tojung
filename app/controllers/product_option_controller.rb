class ProductOptionController < ApplicationController
  before_action :redirect_root_without_admin
  before_action :find_product, only: [:new, :create]
  before_action :find_product_option, only: [:edit, :update]
  # GET '/product/:product_id/new_option'
  def new; end

  # GET '/product_options/:product_option_id/edit'
  def edit; end

  # POST '/product_options/:product_option_id/update'
  def update
    @product_option.updateOption(product_options_params)
    redirect_to '/product/ready/' + @product_option.product.id.to_s
  end

  # POST '/product/:product_id/create_option'
  def create
    @product.createProductOption(product_options_params)
    redirect_to '/product/ready/' + @product.id.to_s
  end

  private

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
