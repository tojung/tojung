class AddUserAccounttToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :user_accountt, :text
  end
end
