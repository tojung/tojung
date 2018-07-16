class AddGoods2ToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :goods2, :text
  end
end