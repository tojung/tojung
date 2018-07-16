class AddAssosToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :assos, :text
  end
end
