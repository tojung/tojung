class AddPackageIdToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :package_id, :integer
  end
end
