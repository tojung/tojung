class CreateVcontractOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :vcontract_options do |t|
      t.integer :base_option_id
      t.text :option_name
      t.integer :price
      t.integer :user_id
      t.integer :propose_id
      t.text :status

      t.timestamps
    end
  end
end
