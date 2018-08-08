class CreateProductOptionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :product_options do |t|
      t.references :product, foreign_key: true
      t.text :name
      t.text :content
      t.integer :price, default: 0
      t.text :status
      t.integer :selled_count, default: 0
      t.integer :remain_count, default: 0
      t.text :image0
      t.timestamps
    end
  end
end
