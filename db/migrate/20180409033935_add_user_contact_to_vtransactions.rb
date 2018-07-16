class AddUserContactToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :user_phone, :text
    add_column :vtransactions, :user_email, :text
  end
end
