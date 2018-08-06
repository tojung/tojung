class ProductController < ApplicationController
  before_action :check_admin, only: [:new, :create, :detail_ready]
  before_action :check_visible, only: [:detail]
  before_action :set_cdn_url, :read_product
  # GET '/product/new'
  def new; end

  # POST '/product/create'
  def create
    product = Product.new
    product.createNew(product_params)

    redirect_to '/product/ready/' + product.id.to_s
  end

  # GET '/product/#{num}'
  def detail
  end

  # GET '/product/ready/#{num}'
  def detail_ready
    # 일반 유저에게 배포하기전 페이지
  end

  private

  def check_admin
    redirect_to '/' if !user_signed_in? || !current_user.admin
  end

  def read_product
    # Redis 적용 예정
    @product = Product.find(params[:product_id])
    @product_options = @product.product_options
  end

  def check_visible
    if @product.visible == false and !(user_signed_in? and current_user.admin)
     redirect_to '/' unless @product.visible
    end
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
  def set_cdn_url
    @cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"
  end

end
