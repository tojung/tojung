class CreateBestBills < ActiveRecord::Migration[5.1]
  def change
    create_table :best_bills do |t|
      t.string :category
      t.text :title
      t.text :content
      t.string :footchair_name
      t.text :problems_content
      t.text :image_0
      t.integer :delay_time
      t.integer :sangjung_time
      t.integer :conference_time
      t.text :review_doc
      t.text :conference_doc
      t.text :assos
      t.text :editor_name
      t.text :designer_name

      t.timestamps
    end
  end
end
