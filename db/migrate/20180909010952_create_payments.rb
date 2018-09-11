class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :imp_uid
      t.string :pg_provider
      t.integer :amount
      t.string :name
      t.string :pay_method
      t.boolean :permission
      t.boolean :validation
      t.string :status
      t.string :receipt_url
      t.string :merchant_uid
      t.timestamps
    end
  end
end
