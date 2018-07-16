class AddImageToVcposts < ActiveRecord::Migration[5.1]
  def change
    add_column :vcposts, :image, :text
  end
end
