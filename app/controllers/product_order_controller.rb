class ProductOrderController < ApplicationController
  before_action :authenticate_user!
  before_action :init_package, only: %i[new create]
  before_action :init_product, only: %i[new create]
  before_action :check_user, :check_price, only: %i[create]
  def new
    @jellycases=['아이폰 5/5S/5SE', '아이폰 6/6S', '아이폰6+/6S+', '아이폰7', '아이폰7+', '아이폰8', '아이폰8+', '아이폰X', '갤럭시S3', '갤럭시S4', '갤럭시S5', '갤럭시S6', '갤럭시S6엣지', '갤럭시S6엣지+', '갤럭시S7', '갤럭시S7엣지', '갤럭시S8', '갤럭시S8+', '갤럭시S9', '갤럭시S9+', '갤럭시노트3', '갤럭시노트4', '갤럭시노트5', '갤럭시노트7', '갤럭시노트8', '갤럭시J5(2015)', '갤럭시J7(2015)', '갤럭시A8(2015)', '갤럭시A5(2016)', '갤럭시A7(2016)', '갤럭시A5(2017)', '갤럭시A7(2017)', '갤럭시A8(2018)', '갤럭시그랜드맥스', '갤럭시그랜드맥스2', '갤럭시 알파', 'LG G3(CAT,6)', 'LG G4', 'LG G5', 'LG G6', 'LG G7', 'LG V10', 'LG V20', 'LG V30']
    @hardcases=['아이폰 4/4S', '아이폰 5C', '아이폰 5/5S/5E', '아이폰 6/6S(4.7인치)', '아이폰 6/6S+', '아이폰7', '아이폰7+', '아이폰8', '아이폰8+', '아이폰X', '갤럭시S2', '갤럭시S3', '갤럭시S4', '갤럭시S4미니', '갤럭시S5', '갤럭시S6', '갤럭시S6엣지', '갤럭시S6엣지+', '갤럭시S7', '갤럭시S7엣지', '갤럭시S8', '갤럭시S8+', '갤럭시S9', '갤럭시S9+', '갤럭시A5(2015)', '갤럭시A7(2015)', '갤럭시A8(2015)', '갤럭시A5(2016)', '갤럭시A7(2016)', '갤럭시A5(2017)', '갤럭시A8(2018)', '갤럭시노트1', '갤럭시노트2', '갤럭시노트3', '갤럭시노트4', '갤럭시노트4엣지', '갤럭시노트5', '갤럭시노트7/FE', '갤럭시노트8', 'LG 옵티머스G', 'LG G2', 'LG G3', 'LG G4', 'LG G5', 'LG G6', 'LG G7', '옵티머스 GPRO', '옵티머스 GPRO2', 'LG V10', 'LG V20', 'LG V30', '베가 아이언2', '베가 시크릿노트' ]
  end

  def create
    ProductOrder.create_order_infos(product_order_params,
                                    product_order_detail_params,
                                    product_delivery_params,
                                    params[:send_email_content],
                                    current_user.email, current_user.id)
    @payment_method = params[:payment_method]
  end

  private

  def check_user
    redirect_root if params[:user_id].to_i != current_user.id
  end

  def check_price
    redirect_root if params[:product_price].to_i < Package.find(params[:package_id]).price
  end

  def init_package
    @package = Package.find(params[:package_id])
  end

  def init_product
    @product = Product.find(params[:product_id])
  end

  def product_order_params
    params.permit(:name, :user_id, :product_id, :package_id)
  end

  def product_order_detail_params
    params.permit(:name, :phone_num, :address_num, :address_text,
                  :address_text2,
                  :email, :product_price, :delivery_price, :total_price,
                  :payment_method)
  end

  def product_delivery_params
    params.permit(:product_id, :package_id)
  end
end
