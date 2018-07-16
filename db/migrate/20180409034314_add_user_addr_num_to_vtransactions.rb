class AddUserAddrNumToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :user_addr_num, :integer
  end
end
