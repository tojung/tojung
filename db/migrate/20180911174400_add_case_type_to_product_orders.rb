class AddCaseTypeToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :case_type, :string
  end
end
