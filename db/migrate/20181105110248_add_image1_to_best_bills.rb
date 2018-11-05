class AddImage1ToBestBills < ActiveRecord::Migration[5.1]
  def change
    add_column :best_bills, :image1, :text
  end
end
