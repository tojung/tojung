class PackageController < ApplicationController
  before_action :redirect_root_except_admin
  before_action :find_product, only: %i[create]
  before_action :find_package, only: %i[edit update show opt_to_package]
  before_action :find_product_options, only: %i[show]

  # GET '/package/new?product_id='
  def new; end

  # GET '/package/:package_id?product_id=' 패키지 상품 구성 하는 페이지
  def show; end

  # GET '/package/:package_id/edit'
  def edit; end

  # POST '/package'
  def create
    package = @product.packages.create(package_params)
    redirect_to "/package/#{package.id}?product_id=#{@product.id}"
  end
2
  # PATCH '/package/:product_id'
  def update
    @package.update_attributes(package_params)
    redirect_to "/product/#{@package.product.id}"
  end

  # POST '/package/:package_id/options'
  def opt_to_package
    @package.product_options.where(id: params[:product_option_id]).empty? ?
        @package.product_options << (ProductOption.find(params[:product_option_id])) :
        @package.product_options.delete(ProductOption.find(params[:product_option_id]))
    redirect_to "/package/#{params[:package_id]}?product_id=#{@package.product.id}"
  end

  private

  def find_package
    @package = Package.find(params[:package_id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_product_options
    @product_options = ProductOption.where(product_id: params[:product_id])
  end

  def package_params
    params.permit(:name,
                  :content,
                  :remain_count,
                  :image0,
                  :product_id,
                  :price)
  end
end
