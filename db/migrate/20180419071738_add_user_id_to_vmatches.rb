class AddUserIdToVmatches < ActiveRecord::Migration[5.1]
  def change
    add_column :vmatches, :user_id, :integer
  end
end
