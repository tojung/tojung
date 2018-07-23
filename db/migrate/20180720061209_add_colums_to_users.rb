class AddColumsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_img, :string
  end
end
