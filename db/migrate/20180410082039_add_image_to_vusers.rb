class AddImageToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :image, :text
  end
end
