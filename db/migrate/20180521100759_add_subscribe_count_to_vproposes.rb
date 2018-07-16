class AddSubscribeCountToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :subscribe_count, :integer
  end
end
