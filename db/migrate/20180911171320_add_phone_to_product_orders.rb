class AddPhoneToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :phone, :string
  end
end
