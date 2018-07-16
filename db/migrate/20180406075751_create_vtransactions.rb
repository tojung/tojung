class CreateVtransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :vtransactions do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :price
      t.integer :total_amount
      t.integer :num
      t.integer :flag

      t.timestamps
    end
  end
end
