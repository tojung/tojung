class AddDeadlineToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :deadline, :date
  end
end
