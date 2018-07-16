class AddUserNameToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :user_name, :text
  end
end
