class AddDeadlinesToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :deadlines, :datetime
  end
end
