class AddPaymentWayToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :payment_way, :text
  end
end
