class PaymentController < ApplicationController
  def new
  end

  def create
    imp_uid = params['imp_uid']
    parsed_imp = Iamport.payment(imp_uid).parsed_response['response']
    # imp = parsed_imp.reject{ |key, value| !Payment.attribute_names.include?(key)}

    if parsed_imp['status'] == 'paid'
      payment = Payment.new()
      payment.imp_uid = parsed_imp['imp_uid']
      parsed_imp.pg_provider = parsed_imp['pg_provider']
      parsed_imp.amount = parsed_imp['amount']
      parsed_imp.status = parsed_imp['status']
      parsed_imp.merchant_uid = parsed_imp['merchant_uid']
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
