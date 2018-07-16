class AddBaesongAddrToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :baesong_addr, :text
  end
end
