class OrderInfoController < ApplicationController
  def new; end

  def show
    @product_orders = OrderInfoService.new(params: params).guest
  end
end