class AddRealNameToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :real_name, :text
  end
end
