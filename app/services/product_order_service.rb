class ProductOrderService
  attr_reader :product_order
  attr_reader :product_order_detail
  attr_reader :product_id
  attr_reader :product

  def initialize(params)
    @params = params
    @product_id = params[:product_id]
  end

  def create
    # 주문 정보 생성 및 연결
    @product = Product.find(@product_id)
    create_product_order
    create_product_delivery
    create_product_order_detail
    relate_models
    increase_funded_count
    update_password # for guest
  end

  def payment_status
    @product_order.status
  end

  def increase_funded_money
    @product.funded_money += @product_order_detail.total_price
    @product.save
  end

  def increase_funded_count
    @product.funded_count += 1
    @product.save
  end
  private

  def update_password
    return if @product_order.user_id != User.first.id ||
              @params[:password].nil? ||
              @params[:password].blank?
    crypt_service = EncryptDecryptService.new(original_string: @params[:password],
                                              cipher_key: ENV['CIPHER_KEY'])
    @product_order_detail.password = crypt_service.encrypt
    @product_order_detail.save
  end

  def relate_models
    @product_order.update_attributes(product_order_detail_id: @product_order_detail.id,
                                     product_delivery_id: @product_delivery.id)
    @product_order_detail.update_attributes(product_order_id: @product_order.id,
                                            product_delivery_id: @product_delivery.id)
    @product_delivery.update_attributes(product_order_id: @product_order.id,
                                        product_order_detail_id: @product_order_detail.id)
  end

  def create_product_delivery
    @product_delivery = ProductDelivery.create(product_delivery_params)
  end

  def create_product_order_detail
    @product_order_detail = ProductOrderDetail.create(product_order_detail_params)
  end

  def create_product_order
    @product_order = ProductOrder.create(product_order_params)
  end

  def product_order_params
    @params.permit(:name, :user_id, :product_id, :package_id, :status, :phone,
                   :case_type, :imp_uid)
  end

  def product_order_detail_params
    @params.permit(:name, :phone_num, :address_num, :address_text,
                   :address_text2,
                   :email, :product_price, :delivery_price, :total_price,
                   :payment_method)
  end

  def product_delivery_params
    @params.permit(:product_id, :package_id)
  end
end
