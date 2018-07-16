class AddProposeIdToVpointlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :vpointlogs, :propose_id, :integer
  end
end
