class AddAttr222ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image0, :text
  end
end
