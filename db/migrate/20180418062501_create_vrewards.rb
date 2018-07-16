class CreateVrewards < ActiveRecord::Migration[5.1]
  def change
    create_table :vrewards do |t|
      t.integer :user_id
      t.text :title
      t.integer :amount
      t.text :category

      t.timestamps
    end
  end
end
