class AddIspayToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :ispay, :boolean
  end
end
