class AddSellerIdToVproducts < ActiveRecord::Migration[5.1]
  def change
    add_column :vproducts, :seller_id, :integer
  end
end
