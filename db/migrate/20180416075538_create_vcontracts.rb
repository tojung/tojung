class CreateVcontracts < ActiveRecord::Migration[5.1]
  def change
    create_table :vcontracts do |t|
      t.integer :propose_id
      t.text :title
      t.text :content
      t.integer :user_id
      t.integer :contract_money
      t.integer :real_pay

      t.timestamps
    end
  end
end
