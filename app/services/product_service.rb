class ProductService
  def initialize(params)
    return if params.nil?
    @product_id = params[:product_id]
    @params = params
  end
  def as_json_include_relations
    product
    res = @product.as_json(include: %i[product_options packages product_caro_images product_likes])
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

  def read_all
    read_all_sorted_desc_by_funded_count
  end

  def reads_by_category_id
    products_all_condition ? read_all_sorted_desc_by_funded_count : read_products_by_category
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

  private

  def products_all_condition
    raise 'category_id is not setting' if @params[:category_id].nil?
    (@params[:category_id] == '7') || (@params[:category_id] == '8')
  end

  def read_products_by_category
    category_list = StaticValueService.new.category_list
    @products = Product.where(category: category_list[@params[:category_id]])
  end

  def read_all_sorted_desc_by_funded_count
    @products = Product.where(visible: [true, 1]).order(funded_count: :desc)
  end
end
