class ProductOrderController < ApplicationController
  # before_action :authenticate_user!
  before_action :init_package, only: %i[new create]
  before_action :init_product, only: %i[new create]
  before_action :user_infos
  before_action :check_price, only: %i[create]
  def new; end

  def create
    ProductOrder.create_order_infos(product_order_params,
                                    product_order_detail_params,
                                    product_delivery_params,
                                    params[:send_email_content],
                                    @user_email, @user_id)
    puts "*"*30
    @payment_method = params[:payment_method]
    @status = params[:status]
  end

  private

  def user_infos
    if current_user != nil
      @user_email = current_user.email
      @user_id = current_user.id
    else
      @user_email = User.first.email
      @user_id = User.first.id
    end
  end

  #def check_user
  #  redirect_root if params[:user_id].to_i != current_user.id
  #end

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
    params.permit(:name, :user_id, :product_id, :package_id, :status, :phone,
                  :case_type, :imp_uid)
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
