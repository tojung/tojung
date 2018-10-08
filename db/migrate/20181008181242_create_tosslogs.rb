class CreateTosslogs < ActiveRecord::Migration[5.1]
  def change
    create_table :tosslogs do |t|
      t.text :orderno
      t.integer :amount
      t.text :productdesc
      t.text :paytoken
      t.integer :status
      t.integer :product_order_id

      t.timestamps
    end
  end
end
