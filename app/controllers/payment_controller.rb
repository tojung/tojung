class PaymentController < ApplicationController
  def new
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
