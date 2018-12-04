class ProductService
  def initialize(params)
    @product_id = params[:product_id]
  end

  def infos
    product
    caro_images
    {
      product: @product,
      product_options: @product.product_options,
      maker_responses: @product.maker_responses,
      product_caros: @product_caros
    }
  end

  def calculate_funded_money
    product
    @product_orders = @product.product_orders
    funded_money = 0
    @product_orders.each do |product_order|
      if product_order.status.include? "완료"
        funded_money += product_order.product_order_detail.total_price
      end
    end
    funded_money
  end

  def product
    @product = Product.find(@product_id)
  end

  def options
    raise 'first call product method' if @product.nil?
    @product_options = @product.product_options
  end

  def orders
    raise 'first call product method' if @product.nil?
    @product_orders = @product.product_orders
  end

  def maker_responses
    raise 'first call product method' if @product.nil?
    @maker_responses = @product.maker_responses
  end

  def caro_images
    @product_caros = ProductCaroImage
                     .where(product_id: @product_id)
                     .order(:num)
  end
end
