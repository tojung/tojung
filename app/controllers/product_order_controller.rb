class ProductOrderController < ApplicationController
  before_action :init_package, only: %i[new create]
  before_action :init_product, only: %i[new create]
  def new
    user_infos
    jelly_cases
    hard_cases
  end

  def create
    user_infos

    @product_order_service = ProductOrderService.new(params)
    @product_order_service.create

    set_data
    send_emails

    valid = validate_payment
    @product.funded_money += @product_order_detail.total_price if valid

    @status = @product_order.status
    create_user
 end

  private

  def set_data
    @payment_method = params[:payment_method]
    @status = params[:status]
    @product_order = @product_order_service.product_order
    @product_order_detail = @product_order_service.product_order_detail
    @product = @product_order_service.product
    @product_order_id = @product_order.id
  end

  def validate_payment
    return false if @status != '결제완료' || @product.package.price == 0
    PaymentService.new(product_order: @product_order).validate
  rescue StandardError
  end

  def user_infos
    if !current_user.nil?
      @user_email = current_user.email
      @user_id = current_user.id
    else
      @user_email = params[:email]
      @user_id = User.first.id
    end
  end

  def init_package
    @package = Package.find(params[:package_id])
  end

  def init_product
    @product = Product.find(params[:product_id])
  end

  def jelly_cases
    @jellycases = StaticValueService.new.jelleycases
  end

  def hard_cases
    @hardcases = StaticValueService.new.hardcases
  end

  def create_user
    u = User.create(email: params[:email], address_num: params[:address_num],
                    address_text: params[:address_text],
                    address_extra: params[:address_text2],
                    name: params[:name], phone_number: params[:phone_num], password: params[:password])
    p = ProductOrder.find(@product_order.id)
    p.user_id = u.id
    p.save
  rescue StandardError
  end

  def send_emails
    MakerResponseService.new(content: params[:send_email_content],
                             user_email: @user_email,
                             user_id: @user_id,
                             product: @product).sends
  end
end
