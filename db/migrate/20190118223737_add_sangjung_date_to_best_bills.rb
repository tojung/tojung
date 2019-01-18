class AddSangjungDateToBestBills < ActiveRecord::Migration[5.1]
  def change
    add_column :best_bills, :sangjung_date, :datetime
  end
end
