require 'net/http'
require 'json'

class TossPaymentService
  attr_reader :params
  attr_reader :http
  attr_reader :is_wrong
  attr_reader :is_pay_complete
  attr_reader :uri
  attr_reader :product_order
  attr_reader :response

  def initialize(params:)
    @params = params
  end

  def complete
    setup_for_complete
    validate_payment
  end

  def continue
    _continue
  end

  private

  def setup_for_complete
    @tosslog = Tosslog.find_by_orderno(@params[:orderNo])
    @uri = URI.parse('https://pay.toss.im/api/v1/status')
    params = {
      'orderNo' => @tosslog.orderno,
      'apiKey' => ENV['TOSS_KEY']
    }

    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @request = Net::HTTP::Post.new(@uri.path)
    @request.set_form_data(params)
    @response = http.request(@request)
  end

  def _continue
    product_order = ProductOrderService.new(@params).read_product_order

    uri = URI.parse('https://pay.toss.im/api/v1/payments')
    orderNo = Time.now.year.to_s + Time.now.mon.to_s + Time.now.day.to_s + Time.now.hour.to_s + Time.now.min.to_s + Time.now.sec.to_s
    expiredTime = Time.now + 60 * 60 * 10
    expiredTime = expiredTime.to_s[0..-7]

    params = {
      'orderNo' => orderNo,
      'amount' => product_order.product_order_detail.total_price,
      'amountTaxFree' => 0,
      'productDesc' => product_order.package.name.to_s,
      'apiKey' => ENV['TOSS_KEY'],
      'expiredTime' => expiredTime,
      'retUrl' => "https://tojung.me/toss/complete?orderNo=#{orderNo}",
      'escrow' => false,
      'autoExecute' => true
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(params)
    response = http.request(request)

    Tosslog.create(orderno: orderNo,
                   amount: product_order.product_order_detail.total_price,
                   productdesc: product_order.package.name.to_s,
                   paytoken: JSON.parse(response.body)['payToken'],
                   status: JSON.parse(response.body)['status'],
                   product_order_id: product_order.id)

    @response = response
  end

  def validate_payment
    @is_wrong = false
    @product_order = ProductOrder.find(@tosslog.product_order_id)

    if JSON.parse(@response.body)['payStatus'] == 'PAY_COMPLETE'

      @product_order.status = '결제완료'
      @product_order.save

      @is_pay_complete = true

      total_price = @product_order.package.price + @product_order.package.delivery_price
      total_price += 3000 if !@product_order.package.hard_only && (@product_order.package.phone == 'y') && (@product_order.case_type == '하드케이스')
      if JSON.parse(@response.body)['amount'] != total_price
        @product_order.status = '토스비정상결제/조작'
        @product_order.save
        @is_pay_complete = false
        @is_wrong = true
        product_order_detail = @product_order.product_order_detail
        product_order_detail.payment_method = '토스비정상결제/조작'
        product_order_detail.save
      else
        product = @product_order.product
        product.funded_money += total_price
        product.save
        product_order_detail = @product_order.product_order_detail
        product_order_detail.total_price = total_price
        product_order_detail.save
      end
    else
      @product_order.status = '결제살패'
      @product_order.save

      @is_pay_complete = false
    end
  end
end
