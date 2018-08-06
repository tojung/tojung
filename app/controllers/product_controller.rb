class ProductController < ApplicationController
  before_action :check_admin, only: [:new, :create, :detail_ready]

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
    # 이 페이지는 redis 적용 예정
    @product = Product.find(params[:product_id])
    # redirect_to '/' unless @product.visible
  end

  # GET '/product/ready/#{num}'
  def detail_ready
    # 일반 유저에게 배포하기전 페이지
    @product = Product.find(params[:product_id])
  end

  private

  def check_admin
    redirect_to '/' if !user_signed_in? || !current_user.admin
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
