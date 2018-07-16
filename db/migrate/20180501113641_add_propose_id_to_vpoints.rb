class AddProposeIdToVpoints < ActiveRecord::Migration[5.1]
  def change
    add_column :vpoints, :propose_id, :integer
  end
end
