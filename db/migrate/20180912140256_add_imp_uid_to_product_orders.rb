class AddImpUidToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :imp_uid, :string
  end
end
