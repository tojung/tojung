class CreateProductTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :product_timelines do |t|
      t.text :name
      t.text :image0
      t.datetime :issued_at
      t.timestamps
    end
  end
end
