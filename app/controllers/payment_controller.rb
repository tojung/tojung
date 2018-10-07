class PaymentController < ApplicationController
  def new
  end

  def toss
    require 'net/http'
    require 'json'
    product_order = ProductOrder.find(params[:product_order_id])

    uri = URI.parse("https://pay.toss.im/api/v1/payments")
    orderNo = Time.now.year.to_s + Time.now.mon.to_s + Time.now.day.to_s + Time.now.hour.to_s + Time.now.min.to_s + Time.now.sec.to_s
    expiredTime = Time.now + 60*60*10
    expiredTime = expiredTime.to_s[0..-7]
    params = {
        "orderNo" => orderNo,
        "amount"=> product_order.product_order_detail.total_price,
        "amountTaxFree"=> 0,
        "productDesc" => "테스트 결제",
        "apiKey" => "sk_test_apikey1234567890",
        "expiredTime" => expiredTime,
        "resultCallback" => "https://tojung.me/"
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(params)
    response = http.request(request)

    p JSON.parse(response.body)

    render json: JSON.parse(response.body)
  end

  def create
    imp_uid = params['imp_uid']
    parsed_imp = Iamport.payment(imp_uid).parsed_response['response']
    # imp = parsed_imp.reject{ |key, value| !Payment.attribute_names.include?(key)}
    puts parsed_imp['status']
    if parsed_imp['status'] == 'paid'
      payment = Payment.new()
      payment.imp_uid = parsed_imp['imp_uid']
      payment.pg_provider = parsed_imp['pg_provider']
      payment.amount = parsed_imp['amount']
      payment.status = parsed_imp['status']
      payment.merchant_uid = parsed_imp['merchant_uid']
      payment.permission = true
      payment.validation = true
      payment.save
      render json: { 'status': 'true' }
    else
      render json: { 'status': 'fail' }
    end
  end

  def complete
  end
end
