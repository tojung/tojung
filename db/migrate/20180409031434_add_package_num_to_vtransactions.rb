class AddPackageNumToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :package_num, :integer
  end
end
