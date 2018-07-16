class AddImageToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :image, :text
  end
end
