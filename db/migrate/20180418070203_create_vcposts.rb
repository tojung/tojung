class CreateVcposts < ActiveRecord::Migration[5.1]
  def change
    create_table :vcposts do |t|
      t.integer :user_id
      t.integer :community_id
      t.integer :propose_id
      t.text :title
      t.text :content
      t.integer :heart

      t.timestamps
    end
  end
end
