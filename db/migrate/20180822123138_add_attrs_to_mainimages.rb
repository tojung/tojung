class AddAttrsToMainimages < ActiveRecord::Migration[5.1]
  def change
    add_column :mainimages, :image3, :text
    add_column :mainimages, :image4, :text
  end
end
