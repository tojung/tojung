class CreateVlikelogs < ActiveRecord::Migration[5.1]
  def change
    create_table :vlikelogs do |t|
      t.integer :user_id
      t.integer :cpost_id
      t.integer :community_id

      t.timestamps
    end
  end
end
