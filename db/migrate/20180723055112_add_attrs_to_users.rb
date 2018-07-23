class AddAttrsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_num, :integer
    add_column :users, :address_text, :text
    add_column :users, :address_extra, :text
  end
end
