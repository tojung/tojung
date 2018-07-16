class CreateVcodes < ActiveRecord::Migration[5.1]
  def change
    create_table :vcodes do |t|
      t.text :user_name
      t.text :code_name
      t.integer :user_id
      t.text :status

      t.timestamps
    end
  end
end
