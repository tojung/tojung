class CreateVcarts < ActiveRecord::Migration[5.1]
  def change
    create_table :vcarts do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :package_name
      t.integer :num
      t.integer :addhoo

      t.timestamps
    end
  end
end
