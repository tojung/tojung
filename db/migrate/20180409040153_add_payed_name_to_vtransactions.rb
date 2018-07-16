class AddPayedNameToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :payed_name, :text
  end
end
