class AddLikeToVcposts < ActiveRecord::Migration[5.1]
  def change
    add_column :vcposts, :like, :integer
  end
end
