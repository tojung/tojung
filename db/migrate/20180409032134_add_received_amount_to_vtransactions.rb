class AddReceivedAmountToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :received_amount, :integer
  end
end
