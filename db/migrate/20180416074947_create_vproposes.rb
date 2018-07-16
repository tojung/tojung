class CreateVproposes < ActiveRecord::Migration[5.1]
  def change
    create_table :vproposes do |t|
      t.text :title
      t.text :content
      t.integer :user_id
      t.integer :funded_money
      t.integer :funded_num
      t.integer :goal_money
      t.text :bg_category_name
      t.text :sm_category_name
      t.text :image
      t.text :status

      t.timestamps
    end
  end
end
