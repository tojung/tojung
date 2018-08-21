class AddAttr2ToProductOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_order_details, :product_order, foreign_key: true
  end
end
