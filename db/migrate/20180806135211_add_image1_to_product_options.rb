class AddImage1ToProductOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :product_options, :image1, :text
  end
end
