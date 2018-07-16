class AddProposeIdToSubscribes < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribes, :propose_id, :integer
  end
end
