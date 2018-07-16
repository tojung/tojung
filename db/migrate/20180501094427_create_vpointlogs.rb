class CreateVpointlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :vpointlogs do |t|
      t.integer :amount
      t.integer :user_id
      t.text :category
      t.boolean :plus

      t.timestamps
    end
  end
end
