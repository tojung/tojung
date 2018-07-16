class AddImageToVcommunities < ActiveRecord::Migration[5.1]
  def change
    add_column :vcommunities, :image, :text
  end
end
