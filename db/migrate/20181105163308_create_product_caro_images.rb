class CreateProductCaroImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_caro_images do |t|
      t.integer :product_id
      t.text :image
      t.integer :num

      t.timestamps
    end
  end
end
