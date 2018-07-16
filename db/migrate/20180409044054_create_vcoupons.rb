class CreateVcoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :vcoupons do |t|
      t.text :name
      t.integer :user_id
      t.integer :serial
      t.integer :total_amount
      t.integer :remain_amount
      t.text :will_expire_date

      t.timestamps
    end
  end
end
