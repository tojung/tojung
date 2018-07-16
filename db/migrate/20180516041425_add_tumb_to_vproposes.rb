class AddTumbToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :tumb, :text
  end
end
