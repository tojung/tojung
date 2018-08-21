class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.text :name
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.references :package, foreign_key: true
      t.string :status, default: '입금대기중'
      t.timestamps
    end
  end
end
