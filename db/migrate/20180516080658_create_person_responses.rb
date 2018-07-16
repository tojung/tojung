class CreatePersonResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :person_responses do |t|
      t.text :name
      t.integer :person_id
      t.text :response_type
      t.text :response_text
      t.text :send_count

      t.timestamps
    end
  end
end
