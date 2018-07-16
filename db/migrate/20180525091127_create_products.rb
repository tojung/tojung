class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :remain_num
      t.integer :shop_id
      t.integer :price

      t.timestamps
    end
  end
end
