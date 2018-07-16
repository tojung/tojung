class CreateVcandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :vcandidates do |t|
      t.integer :propose_id
      t.integer :seller_id
      t.integer :vuser_id
      t.integer :vote_num

      t.timestamps
    end
  end
end
