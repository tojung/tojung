class Go < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.integer :selled_count, default: 0
      t.integer :remain_count, default: 10000
      t.references :product, foreign_key: true
      t.integer :price, default: 0
      t.text :name
      t.text :content
      t.text :image0
      t.timestamps
    end
  end
end
