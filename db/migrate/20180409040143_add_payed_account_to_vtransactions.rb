class AddPayedAccountToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :payed_account, :text
  end
end
