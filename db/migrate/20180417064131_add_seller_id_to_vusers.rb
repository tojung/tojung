class AddSellerIdToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :seller_id, :integer
  end
end
