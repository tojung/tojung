class AddPackagePriceToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :package_price, :integer
  end
end
