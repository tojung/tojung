class AddOrderLogIdToOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :order_log_id, :integer
  end
end
