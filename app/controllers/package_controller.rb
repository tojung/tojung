class PackageController < ApplicationController
  before_action :redirect_root_except_admin
  before_action :find_options_and_product, only: %i[new new2 create]

  # GET '/product/:product_id/package/new'
  def new; end

  # GET '/package/:package_id'
  def edit
    @package = Package.find(params[:package_id])
  end

  # POST '/package/:product_id'
  def update
    @package = Package.find(params[:package_id])
    @package.image0 = params[:image0]
    @package.name = params[:name]
    @package.content = params[:content]
    @package.price = params[:price]
    @package.remain_count = params[:remain_count]
    @package.save

    redirect_root
  end
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
    if package.product_options.where(id: params[:product_option_id]).length == 0
      package.product_options << ProductOption.find(params[:product_option_id])
    else
      package.product_options.delete(ProductOption.find(params[:product_option_id]))
    end
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
