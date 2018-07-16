class AddUserAccountToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :user_account, :integer
  end
end
