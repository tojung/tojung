class CreateVheartlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :vheartlogs do |t|
      t.integer :propose_id
      t.integer :user_id
      t.integer :target_id
      t.text :target_category

      t.timestamps
    end
  end
end
