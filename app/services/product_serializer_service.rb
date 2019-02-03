class ProductSerializerService
  def initialize(params)
    return if params.nil?
    @product_id = params[:product_id]
    @params = params
  end

  def products
    Product.all.as_json
  end

  def product_more
    _product
    res = @product.as_json(include: %i[product_options packages product_caro_images product_likes product_timelines])
    res['isLike'] = true
    if res['product_likes'] == [] || res['product_likes'][0]['status'] == false
      res['isLike'] = false
    end
    if @product.product_options != []
      res['product_options'].each do |option|
        option['packageIds'] = @product.product_options.find(option['id']).packages.ids
      end
    end
    res['maker_responses'] = @product.maker_responses.as_json(include: [:maker])
    res['isEnd'] = @product.end_date <= Time.now
    res
  end

  private

  def _product
    @product = Product.find(@product_id)
  end
end
