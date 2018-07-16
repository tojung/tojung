class AddSendCountToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :send_count, :integer
  end
end
