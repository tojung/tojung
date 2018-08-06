class ProductUpdaterController < ApplicationController
  before_action :check_admin
  before_action :find_product
 
  # GET 'product/edit/:product_id'
  def edit
  end
  
  # GET 'product/visible/:product_id'
  def set_visible
    if @product.visible == true or @product.visible == 1
       @product.visible = true
       @product.save
    else 
       @product.visible = false 
       @product.save
    end
  end

  # POST '/product/update/:product_id'
  def update
    @product.updateNormal(update_normal_params)

    redirect_to '/product/ready/' + @product.id.to_s
  end

  # GET '/product/image0/:product_id'
  def imagedit; end

  # GET '/product/image1/:product_id'
  def imagedit2; end

  # POST '/product/image0/:product_id'
  def update_image0
    # 메인 이미지
    @product.updateImage0(update_image0_params)

    redirect_to '/product/ready/' + @product.id.to_s
  end

  # POST '/product/image1/:product_id'
  def update_image1
    # 패키지 정리 이미지
    @product.updateImage1(update_image1_params)

    redirect_to '/product/ready/' + @product.id.to_s
  end

  private

  def check_admin
    redirect_to '/' if !user_signed_in? || !current_user.admin
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
