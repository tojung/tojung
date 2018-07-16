class AddUserIdToVcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :vcomments, :user_id, :integer
  end
end
