class ProductOrderFullService
  attr_reader :status, :product_order_id

  def initialize(params:, user_email:, user_id:)
    @params = params
    @user_email = user_email
    @user_id = user_id
  end

  # 주문정보생성,검증,이메일 전송,가입시키기,패스워드추가
  def call
    product_order_service = ProductOrderService.new(@params)
    product_order_service.create
    if validate_payment(product_order_service: product_order_service)
      product_order_service.increase_funded_money
    end

    send_to_makers(product: product_order_service.product,
                   user_email: @user_email,
                   user_id: @user_id,
                   content: @params[:send_email_content])
    @product_order_id = product_order_service.product_order.id

    begin
      create_user(@product_order_id)
    rescue StandardError
      # ignored
    end
  end

  private

  def create_user(product_order_id:)
    return if @user_id != User.first.id ||
              @params[:register] == 'false'
    u = User.create(email: @user_email, address_num: params[:address_num],
                    address_text: params[:address_text],
                    address_extra: params[:address_text2],
                    name: params[:name], phone_number: params[:phone_num], password: params[:password])

    p = ProductOrder.find(product_order_id)
    p.user_id = u.id
    p.save
  end

  def send_to_makers(product:, user_email:, user_id:, content:)
    MakerResponseService.new(content: content,
                             user_email: user_email,
                             user_id: user_id,
                             product: product).sends
  end

  # @param [ProductOrderService] product_order_service
  # @return [Boolean]
  def validate_payment(product_order_service:)
    # 결제값 검증 / 결제 조작의 경우 기록
    @status = product_order_service.payment_status
    product_order = product_order_service.product_order

    return false if @status != '결제완료' || product_order.package.price.zero?
    PaymentService.new(product_order: product_order).validate
  end
end
