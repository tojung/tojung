class ProductOptionSerializerService
  def initialize(params)
    return if params.nil?
    @product_option_id = params[:product_option_id]
    @params = params
  end
  def product_option
    ProductOption.find(@product_option_id).as_json
  end
end