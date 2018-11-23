require 'net/http'
require 'json'

class PaymentController < ApplicationController
  # def new
  # end

  def toss_complete
    tosslog = Tosslog.find_by_orderno(params[:orderNo])
    uri = URI.parse("https://pay.toss.im/api/v1/status")
    params = {
        "orderNo"=> tosslog.orderno,
        "apiKey"=> ENV["TOSS_KEY"]
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(params)
    response = http.request(request)

    p JSON.parse(response.body)
    @is_wrong = false
    if JSON.parse(response.body)["payStatus"] == "PAY_COMPLETE"
      product_order = ProductOrder.find(tosslog.product_order_id)
      product_order.status = "결제완료"
      product_order.save
      @is_pay_complete = true
      @product_order = product_order

      total_price = product_order.package.price + product_order.package.delivery_price
      total_price += 3000 if !product_order.package.hard_only && (product_order.package.phone == 'y') && (product_order.case_type == '하드케이스')

      if JSON.parse(response.body)["amount"] != total_price
        product_order.status = "토스비정상결제/조작"
        product_order.save
        @is_pay_complete = false
        @is_wrong = true
        product_order_detail = product_order.product_order_detail
        product_order_detail.payment_method = "토스비정상결제/조작"
        product_order_detail.save
      end
    else
      product_order = ProductOrder.find(tosslog.product_order_id)
      product_order.status = "결제살패"
      product_order.save

      @is_pay_complete = false
    end
  end

  def toss

    product_order = ProductOrder.find(params[:product_order_id])

    uri = URI.parse("https://pay.toss.im/api/v1/payments")
    orderNo = Time.now.year.to_s + Time.now.mon.to_s + Time.now.day.to_s + Time.now.hour.to_s + Time.now.min.to_s + Time.now.sec.to_s
    expiredTime = Time.now + 60*60*10
    expiredTime = expiredTime.to_s[0..-7]

    params = {
        "orderNo" => orderNo,
        "amount"=> product_order.product_order_detail.total_price,
        "amountTaxFree"=> 0,
        "productDesc" => "#{ product_order.package.name  }",
        "apiKey" => ENV["TOSS_KEY"],
        "expiredTime" => expiredTime,
        "retUrl" => "https://tojung.me/toss/complete?orderNo=#{ orderNo }",
        "escrow" => false,
        "autoExecute" => true
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(params)
    response = http.request(request)

    Tosslog.create(orderno: orderNo,
                   amount: product_order.product_order_detail.total_price,
                   productdesc: "#{ product_order.package.name  }",
                   paytoken: JSON.parse(response.body)["payToken"],
                   status: JSON.parse(response.body)["status"],
                   product_order_id: product_order.id
                   )
    p JSON.parse(response.body)

    render json: JSON.parse(response.body)
  end

  def create
    imp_uid = params['imp_uid']
    parsed_imp = Iamport.payment(imp_uid).parsed_response['response']
    # imp = parsed_imp.reject{ |key, value| !Payment.attribute_names.include?(key)}
    # puts parsed_imp['status']
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
