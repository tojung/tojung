class AddDefaultImageToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :default_image, :text
  end
end
