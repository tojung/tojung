require 'net/http'
require 'json'

class PaymentController < ApplicationController
  def toss_complete
    action_service = TossPaymentService.new(params: params)
    action_service.complete

    @is_pay_complete = action_service.is_pay_complete
    @is_wrong = action_service.is_wrong
    @product_order = action_service.product_order
  end

  def toss
    action_service = TossPaymentService.new(params: params)
    action_service.continue

    render json: JSON.parse(action_service.response.body)
  end
end