class PackageController < ApplicationController
  before_action :redirect_root_except_admin
  before_action :find_options_and_product, only: %i[new new2 create]

  # GET '/product/:product_id/package/new'
  def new; end

  # GET '/product/:product_id/package/:package_id'
  def new2
    @package = Package.find(params[:package_id])
  end

  # POST '/product/:product_id/package/create'
  def create
    p = @product.createPackage(package_params)
    redirect_to "/product/#{@product.id}/package/#{p.id}"
  end

  # GET '/package/:package_id/product_option/:product_option_id'
  def insert_option_to_package
    package = Package.find(params[:package_id])
    package.product_options << ProductOption.find(params[:product_option_id])
    package.save

    redirect_to "/product/#{package.product.id}/package/#{ package.id }"
  end

  private

  def find_options_and_product
    @product = Product.find(params[:product_id])
    @product_options = @product.product_options
  end

  def package_params
    params.permit(:name, :content, :price, :image0)
  end
end
