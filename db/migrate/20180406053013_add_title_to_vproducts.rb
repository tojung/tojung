class AddTitleToVproducts < ActiveRecord::Migration[5.1]
  def change
    add_column :vproducts, :title, :text
  end
end
