class AddDeadlineToVcontracts < ActiveRecord::Migration[5.1]
  def change
    add_column :vcontracts, :deadline, :date
  end
end
