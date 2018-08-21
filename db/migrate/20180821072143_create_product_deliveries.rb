class CreateProductDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :product_deliveries do |t|
      t.references :product_order, foreign_key: true
      t.references :product, foreign_key: true
      t.references :package, foreign_key: true
      t.string :status, default: '준비중'
      t.timestamps
    end
  end
end
