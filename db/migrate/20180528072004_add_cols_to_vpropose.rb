class AddColsToVpropose < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :bill_name, :text
    add_column :vproposes, :bill_id, :text
  end
end
