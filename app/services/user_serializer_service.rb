class UserSerializerService
  def initialize(user)
    @user = user
  end

  def include_all
    res = @user.as_json
    res['ordered_product_count'] = CalculateService
                                   .user_ordered_product_count(user: @user)
    res['liked_product_count'] = CalculateService
                                 .user_liked_product_count(user: @user)
    res['product_orders'] = @user
                            .product_orders
                            .as_json(include: %i[product product_order_detail package],
                                     except: %i[imp_uid])
    res['product_orders'].each do |product_order|
      if product_order['product_order_detail']
        product_order['product_order_detail']['password'] = product_order['product_order_detail']['password']
      end
    end
    res['product_likes'] = @user.product_likes.where(status: true)
                               .as_json(include: %i[product])
    res
  end
end
