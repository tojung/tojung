class AddPackageIdToVcarts < ActiveRecord::Migration[5.1]
  def change
    add_column :vcarts, :package_id, :integer
  end
end
