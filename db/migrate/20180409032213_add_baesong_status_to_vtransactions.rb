class AddBaesongStatusToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :baesong_status, :text
  end
end
