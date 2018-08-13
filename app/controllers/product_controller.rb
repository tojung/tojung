class ProductController < ApplicationController
  before_action :redirect_root_except_admin, except: %i[show]
  before_action :read_product_infos, :check_admin, only: %i[detail_ready show]
  before_action :find_product, only: %i[update edit]

  # GET '/product/new'
  def new; end

  # POST '/product'
  def create
    product = Product.create(product_params)
    redirect_to "/product/ready/#{product.id}"
  end

  # GET '/product/#{num}'
  def show
    render :detail
  end

  # GET '/product/:product_id/edit'
  def edit; end

  # PATCH '/product/:product_id'
  def update
    @product.update_attributes(product_params)
    redirect_to "/product/ready/#{@product.id}"
  end

  # GET '/product/ready/#{num}' 비공개 모드일때의 페이지 및 관리자용
  def detail_ready; end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def read_product_infos
    # Redis 적용 예정
    @product = Product.find(params[:product_id])
    @product_options = @product.product_options
    @makers = Maker.where(assos: @product.assos)
  end

  def product_params
    params.permit(:name,
                  :subname,
                  :start_date,
                  :end_date,
                  :youtb_url,
                  :video_text,
                  :bill_url,
                  :assos,
                  :fb_url,
                  :image0,
                  :image1,
                  :goal_money,
                  :category,
                  :visible)
  end
end
