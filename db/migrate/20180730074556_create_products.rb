class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :subname, default: ''
      t.datetime :start_date, null: false, default: Time.now
      t.datetime :end_date, null: false, default: Time.now + (60 * 60 * 24 * 30)
      t.text :youtb_url, default: ''
      t.text :video_text, default: ''
      t.text :bill_url, default: ''
      t.text :image0, default: ''
      t.text :assos, default: ''
      t.text :fb_url, default: ''
      t.text :image1, default: ''
      t.text :content, default: ''
      t.integer :funded_money, default: 0
      t.integer :funded_count, default: 0
      t.text :status, default: ''
      t.text :category, default: ''
      t.integer :goal_money, default: 1000000
      t.boolean :visible, default: 0

      t.timestamps
    end
  end
end
