class AddBillStartToBestBills < ActiveRecord::Migration[5.1]
  def change
    add_column :best_bills, :bill_start, :datetime
  end
end
