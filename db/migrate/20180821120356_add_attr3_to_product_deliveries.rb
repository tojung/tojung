class AddAttr3ToProductDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_deliveries, :product_order_detail, foreign_key: true
  end
end
