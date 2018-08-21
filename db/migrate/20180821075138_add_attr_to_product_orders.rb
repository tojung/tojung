class AddAttrToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_orders, :product_delivery, foreign_key: true
    add_reference :product_orders, :product_order_detail, foreign_key: true
  end
end
