class AddUserAttr2ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :text
    add_column :users, :phone_number, :text
  end
end
