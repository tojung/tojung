class CreateEsendlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :esendlogs do |t|
      t.integer :propose_id
      t.integer :person_id
      t.text :from_email
      t.text :to_email
      t.text :content
      t.text :title

      t.timestamps
    end
  end
end
