class CreateResponselogs < ActiveRecord::Migration[5.1]
  def change
    create_table :responselogs do |t|
      t.string :title
      t.integer :maker_response_id

      t.timestamps
    end
  end
end
