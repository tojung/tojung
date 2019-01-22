class AddBillIdToBestBills < ActiveRecord::Migration[5.1]
  def change
    add_column :best_bills, :bill_id, :integer
  end
end
