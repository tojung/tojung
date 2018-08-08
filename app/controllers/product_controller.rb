class ProductController < ApplicationController
  before_action :redirect_root_except_admin, only: %i[new create detail_ready]
  # before_action :check_visible, only: [:detail]
  before_action :read_product, :check_admin, only: %i[detail_ready detail]
  # GET '/product/new'
  def new; end

  # POST '/product/create'
  def create
    product = Product.new
    product.createNew(product_params)

    redirect_to "/product/ready/#{product.id}"
  end

  # GET '/product/#{num}'
  def detail; end

  # GET '/product/ready/#{num}'
  def detail_ready
    # 일반 유저에게 배포하기전 페이지
  end

  private

  def read_product
    # Redis 적용 예정
    @product = Product.find(params[:product_id])
    @product_options = @product.product_options
  end

  def product_params
    params.permit(:title,
                  :subtitle,
                  :start_date,
                  :end_date,
                  :youtb_url,
                  :youtb_content,
                  :bill_url,
                  :assos,
                  :fb_url,
                  :image0,
                  :goal_money)
  end
end
