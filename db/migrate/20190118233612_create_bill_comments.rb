class CreateBillComments < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_comments do |t|
      t.integer :user_id
      t.text :content
      t.integer :best_bill_id

      t.timestamps
    end
  end
end
