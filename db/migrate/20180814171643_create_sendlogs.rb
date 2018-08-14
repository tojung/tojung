class CreateSendlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :sendlogs do |t|
      t.string :from_email
      t.string :to_email
      t.integer :user_id
      t.text :content
      t.text :title

      t.timestamps
    end
  end
end
