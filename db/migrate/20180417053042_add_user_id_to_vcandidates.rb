class AddUserIdToVcandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :vcandidates, :user_id, :integer
  end
end
