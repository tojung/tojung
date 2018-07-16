class AddSerialToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :serial, :integer
  end
end
