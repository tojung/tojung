class AddVproductIdToVcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :vcomments, :vproduct_id, :integer
  end
end
