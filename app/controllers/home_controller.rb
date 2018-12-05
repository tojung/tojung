class HomeController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!, only: %i[mypage myorder]

  # GET '/' 메인 페이지
  def index
    read_images
    read_products_all
  end

  def search
    @result = ProductSearchService.new(term: params[:term]).call
  end

  def categorize
    @num = params[:category_id]
    products_all_condition ? read_products_all : read_products_by_category
  end

  def sidebar_categorize
    redirect_to root_path(sidebar: params[:id])
  end

  # GET '/about' about 페이지
  def about; end

  def privacy; end

  def policy; end

  def brand; end

  def mypage
    cal_uproduct_count
  end

  # GET '/best/:id'
  def best
    @bill = BestBill.find(params[:id])
    @footchairs = Maker.where(assos: @bill.assos)
  end

  def myorder
    cal_uproduct_count
  end

  def guestorder
  end

  def guestorderinfo
  end
  private

  def read_category_list
    @category_list = StaticValueService.new.category_list
  end

  def cal_uproduct_count
    @ordered_product_count = 0
    uproducts = []
    current_user.product_orders.each do |product_order|
      uproducts.append(product_order.product.id) unless uproducts.include? product_order.product.id
    end
    @ordered_product_count = uproducts.length
  end

  def read_images
    mainimage = Mainimage.last
    @mainimage0 = mainimage.image0
    @mainimage1 = mainimage.image1
    @mainimage2 = mainimage.image2
    @mainimage3 = mainimage.image3
    @mainimage4 = mainimage.image4
    @md_link0 = mainimage.md_link0
    @md_link1 = mainimage.md_link1
  end

  def read_products_all
    @products = Product.where(visible: [true, 1]).order(funded_count: :desc)
  end

  def products_all_condition
    (params[:category_id] == '7') || (params[:category_id] == '8')
  end

  def read_products_by_category
    read_category_list
    @products = Product.where(category: @category_list[params[:category_id]])
  end
end
