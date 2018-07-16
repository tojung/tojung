class CreateVpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :vpoints do |t|
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
