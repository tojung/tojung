class AddImagesssToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :campaign, :text
  end
end
