class AddUserIdToVsellers < ActiveRecord::Migration[5.1]
  def change
    add_column :vsellers, :user_id, :integer
  end
end
