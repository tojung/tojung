class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :subname
      t.datetime :start_date, null: false, default: Time.now
      t.datetime :end_date, null: false, default: Time.now + (60 * 60 * 24 * 30)
      t.text :youtb_url
      t.text :video_text
      t.text :bill_url
      t.text :image0
      t.text :assos
      t.text :fb_url
      t.text :image1
      t.text :content
      t.integer :funded_money, default: 0
      t.integer :funded_count, default: 0
      t.text :status
      t.text :category
      t.integer :goal_money, default: 1000000
      t.boolean :visible, default: 0

      t.timestamps
    end
  end
end
