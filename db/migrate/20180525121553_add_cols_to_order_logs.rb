class AddColsToOrderLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :order_logs, :address_text, :text
    add_column :order_logs, :address_detail, :text
  end
end
