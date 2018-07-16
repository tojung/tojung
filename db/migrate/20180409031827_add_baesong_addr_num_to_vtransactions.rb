class AddBaesongAddrNumToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :baesong_addr_num, :integer
  end
end
