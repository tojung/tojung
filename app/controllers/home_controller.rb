class HomeController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!, only: %i[mypage myorder]
  before_action :require_more_data
  # GET '/' 메인 페이지
  def index
    read_images
    read_products_all
  end

  def search
    @result = ProductSearchService.new(term: params[:term]).call
  end

  def categorize
    @products = ProductService.new(params).reads_by_category_id
    @num = params[:category_id]
    # products_all_condition ? read_products_all : read_products_by_category
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
    action_service = BestBillService.new(params)
    @bill = action_service.read_bill
    @footchairs = action_service.reads_maker

    raise 'bill is nil' if @bill.nil?
    raise 'footchairs is nil' if @footchairs.nil?
  end

  def myorder
    cal_uproduct_count
  end

  private

  def cal_uproduct_count
    @ordered_product_count = 0
    uproducts = []
    current_user.product_orders.each do |product_order|
      uproducts.append(product_order.product.id) unless uproducts.include? product_order.product.id
    end
    @ordered_product_count = uproducts.length
  end

  def read_images
    mainimages = MainimageService.new.read_last

    @mainimage0 = mainimages[:image0]
    @mainimage1 = mainimages[:image1]
    @mainimage2 = mainimages[:image2]
    @mainimage3 = mainimages[:image3]
    @mainimage4 = mainimages[:image4]
    @md_link0 = mainimages[:md_link0]
    @md_link1 = mainimages[:md_link1]
  end

  def read_products_all
    @products = ProductService.new(nil).read_all
  end

end
