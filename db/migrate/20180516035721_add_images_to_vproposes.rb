class AddImagesToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :goods, :text
  end
end
