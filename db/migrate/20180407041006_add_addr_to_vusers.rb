class AddAddrToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :address, :text
  end
end
