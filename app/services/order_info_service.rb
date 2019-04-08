class OrderInfoService
  def initialize(params:)
    @params = params
  end

  def guest
    @product_order_details = ProductOrderDetail.where(email: @params[:email],
                                                      name: @params[:name],
                                                      phone_num: @params[:phone_num])
    @product_orders = []
    @product_order_details.each do |product_order_detail|
      next if product_order_detail.product_order.status == '결제진행중'
      @product_orders.push(ProductOrder.find(product_order_detail.product_order_id))
    end
    @product_orders
  end
end
