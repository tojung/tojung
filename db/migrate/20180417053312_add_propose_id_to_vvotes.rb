class AddProposeIdToVvotes < ActiveRecord::Migration[5.1]
  def change
    add_column :vvotes, :propose_id, :integer
  end
end
