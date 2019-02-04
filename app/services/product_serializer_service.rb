class ProductSerializerService
  def initialize(params)
    return if params.nil?
    @product_id = params[:product_id]
    @params = params
  end

  def products
    Product.where(visible: [true, 1]).order(funded_count: :desc).as_json
  end

  def product_more
    _product
    res = @product.as_json(include: %i[product_options packages product_caro_images product_timelines])
    res['isLike'] = true
    # if res['product_likes'] == [] || res['product_likes'][0]['status'] == false
    #   res['isLike'] = false
    # end
    # 구현 필요.
    res['product_options'].each do |option|
      option['packageIds'] = @product.product_options.find(option['id']).packages.ids
      option['package_names'] = @product.product_options.find(option['id']).packages.map(&:name)
    end
    res['product_timelines'].each do |timeline|
      if timeline['issued_at']
        timeline['issued_at'] = timeline['issued_at'].strftime('%Y.%m.%d')
      end
    end
    res['maker_responses'] = @product.maker_responses.as_json(include: [:maker], except: %i[agree_hash disagree_hash email])
    res['send_count'] = @product.maker_responses.sum(&:send_count)
    res['isEnd'] = @product.end_date <= Time.now
    res
  end

  private

  def _product
    @product = Product.find(@product_id)
  end
end
