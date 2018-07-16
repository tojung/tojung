class RemoveProductIdToVcomments < ActiveRecord::Migration[5.1]
  def change
    remove_column :vcomments, :product_id, :text
  end
end
