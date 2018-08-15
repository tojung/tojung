class AddAttrToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :bill_id, :integer
    add_column :products, :bill_name, :text
  end
end
