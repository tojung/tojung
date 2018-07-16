class AddAddressNumToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :address_num, :integer
  end
end
