class CalculateService
  def self.user_ordered_product_count(user:)
    ordered_product_count = 0
    uproducts = []
    user.product_orders.each do |product_order|
      uproducts.append(product_order.product.id) unless uproducts.include? product_order.product.id
    end
    ordered_product_count = uproducts.length
    ordered_product_count
  end
end