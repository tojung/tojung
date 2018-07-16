class CreateVpledges < ActiveRecord::Migration[5.1]
  def change
    create_table :vpledges do |t|
      t.text :content
      t.integer :propose_id
      t.integer :seller_id
      t.integer :candidate_id
      t.integer :user_id
      t.text :status

      t.timestamps
    end
  end
end
