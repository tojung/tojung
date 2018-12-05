class AddPasswordToProductOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :product_order_details, :password, :text
  end
end
