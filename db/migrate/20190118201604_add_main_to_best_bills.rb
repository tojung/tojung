class AddMainToBestBills < ActiveRecord::Migration[5.1]
  def change
    add_column :best_bills, :main, :boolean
  end
end
