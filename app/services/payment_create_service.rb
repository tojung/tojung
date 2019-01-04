class PaymentCreateService
  def initialize(params:)
    @params = params
  end

  def call
    read_status
    store_payment_info if paid?
    paid?.to_s
  end

  private

  def read_status
    @parsed_imp = Iamport.payment(@params['imp_uid']).parsed_response['response']
    @status = @parsed_imp['status']
  end

  def store_payment_info
    payment = Payment.new
    payment.imp_uid = @parsed_imp['imp_uid']
    payment.pg_provider = @parsed_imp['pg_provider']
    payment.amount = @parsed_imp['amount']
    payment.status = @parsed_imp['status']
    payment.merchant_uid = @parsed_imp['merchant_uid']
    payment.permission = true
    payment.validation = true
    payment.save
  end

  def paid?
    @status == 'paid'
  end
end
