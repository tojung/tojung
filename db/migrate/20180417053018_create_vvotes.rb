class CreateVvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :vvotes do |t|
      t.integer :candidate_id
      t.integer :user_id

      t.timestamps
    end
  end
end
