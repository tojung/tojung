class CreateVpackages < ActiveRecord::Migration[5.1]
  def change
    create_table :vpackages do |t|
      t.integer :product_id
      t.text :name
      t.integer :price

      t.timestamps
    end
  end
end
