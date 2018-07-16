class AddIntrodeadToVproducts < ActiveRecord::Migration[5.1]
  def change
    add_column :vproducts, :intro, :text
    add_column :vproducts, :deadline, :integer
  end
end
