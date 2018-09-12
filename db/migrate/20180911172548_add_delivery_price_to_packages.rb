class AddDeliveryPriceToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :delivery_price, :integer
  end
end
