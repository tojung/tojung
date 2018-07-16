class AddNameToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :name, :text
  end
end
