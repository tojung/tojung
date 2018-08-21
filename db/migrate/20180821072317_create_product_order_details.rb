class CreateProductOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :product_order_details do |t|
      t.integer :address_num
      t.text :address_text
      t.text :address_text2
      t.string :phone_num
      t.string :phone_num2
      t.string :email
      t.string :name
      t.integer :product_price
      t.integer :delivery_price
      t.integer :total_price
      t.string :payment_method
      t.integer :payment_amount
      t.references :product_delivery
      t.timestamps
    end
  end
end
