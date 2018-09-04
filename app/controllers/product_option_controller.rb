class ProductOptionController < ApplicationController
  before_action :redirect_root_except_admin, except: %i[show detail]
  # before_action :authenticate_user!
  before_action :find_product, only: %i[new create]
  before_action :find_product_option, only: %i[edit update detail show]
  # GET '/product_option/new?product_id='
  def new; end

  # GET '/product_options/:product_option_id/edit'
  def edit; end
  
  def show
  end

  # GET '/product_options/:product_option_id/detail'
  def detail; end

  # PATCH '/product_options/:product_option_id'
  def update
    @product_option.update_attributes(product_options_params)
    redirect_ready_page
  end

  # POST '/product/:product_id'
  def create
    @product.product_options.create(product_options_params)
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
      :name,
      :content,
      :price,
      :image0,
      :remain_count,
      :status,
      :image1
    )
  end
end
