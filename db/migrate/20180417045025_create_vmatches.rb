class CreateVmatches < ActiveRecord::Migration[5.1]
  def change
    create_table :vmatches do |t|
      t.integer :propose_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
