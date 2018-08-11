class CreateMakerResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :maker_responses do |t|
      t.references :product, foreign_key: true
      t.references :maker, foreign_key: true
      t.string :name
      t.string :response_type, default: '무응답'
      t.text :response_text
      t.integer :send_count
      t.text :agree_hash
      t.text :disagree_hash
      t.timestamps
    end
  end
end
