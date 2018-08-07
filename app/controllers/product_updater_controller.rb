class ProductUpdaterController < ApplicationController
  before_action :redirect_root_except_admin
  before_action :find_product
  after_action :redirect_ready_page, only: %i[update update_image0 update_image1]
  # GET 'product/edit/:product_id'
  def edit; end

  # GET 'product/visible/:product_id'
  def set_visible
    @product.reverse_visible
  end

  # POST '/product/update/:product_id'
  def update
    @product.updateNormal(update_normal_params)
  end

  # GET '/product/image0/:product_id'
  def imagedit; end

  # GET '/product/image1/:product_id'
  def imagedit2; end

  # POST '/product/image0/:product_id'
  def update_image0
    # 메인 이미지
    @product.updateImage0(update_image0_params)
  end

  # POST '/product/image1/:product_id'
  def update_image1
    # 패키지 정리 이미지
    @product.updateImage1(update_image1_params)
  end

  private

  def redirect_ready_page
    redirect_to "/product/ready/#{@product.id}"
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def update_normal_params
    params.permit(
      :title, :subtitle,
      :youtb_url,
      :youtb_content,
      :assos,
      :fb_url,
      :goal_money, :bill_url
    )
  end

  def update_image0_params
    params.permit(:image0)
  end

  def update_image1_params
    params.permit(:image1)
  end
end
