class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.text :selled_count
      t.text :remain_count
      t.references :product, foreign_key: true
      t.text :price
      t.text :name
      t.text :content
      t.text :image0
      t.timestamps
    end
  end
end
