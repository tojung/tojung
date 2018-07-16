class CreateOrderLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :order_logs do |t|
      t.text :title
      t.text :order_person
      t.text :to_person
      t.text :address
      t.text :phone
      t.text :payer
      t.text :status
      t.integer :total_price

      t.timestamps
    end
  end
end
