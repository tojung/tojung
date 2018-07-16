class CreateVproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :vproducts do |t|
      t.integer :bill_id
      t.integer :fake_price
      t.integer :price
      t.text :main_image_link
      t.integer :total_buy

      t.timestamps
    end
  end
end
