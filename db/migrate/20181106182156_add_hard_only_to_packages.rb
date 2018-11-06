class AddHardOnlyToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :hard_only, :boolean
  end
end
