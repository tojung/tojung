class CreateVcontributors < ActiveRecord::Migration[5.1]
  def change
    create_table :vcontributors do |t|
      t.integer :user_id
      t.integer :propose_id
      t.integer :count

      t.timestamps
    end
  end
end
