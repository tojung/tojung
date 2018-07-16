class AddGoods3ToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :goods3, :text
  end
end
