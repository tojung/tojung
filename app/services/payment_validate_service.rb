class PaymentValidateService
  attr_reader :product_order
  def initialize(product_order:)
    @product_order = product_order
  end

  def validate
    total_price = @product_order.package.price + @product_order.package.delivery_price
    total_price += 3000 if !@product_order.package.hard_only && (@product_order.package.phone == 'y') && (@product_order.case_type == '하드케이스')

    if @product_order.imp_uid.nil? || Iamport.payment(@product_order.imp_uid).parsed_response['response'].nil?
      record_wrong_payment
      return false
    end

    pay_status = Iamport.payment(@product_order.imp_uid).parsed_response['response']['status']
    pay_amount = Iamport.payment(@product_order.imp_uid).parsed_response['response']['amount']

    if (pay_status != 'paid') || (pay_amount != total_price)
      record_wrong_payment
      return false
    end
    true
  end

  private

  def record_wrong_payment
    @product_order.status = '비정상결제조작'
    @product_order_detail.payment_method = @product_order_detail.payment_method + '비정상결제조작'
    @product_order.save
    @product_order_detail.save
  end
end
