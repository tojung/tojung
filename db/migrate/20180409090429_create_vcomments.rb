class CreateVcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :vcomments do |t|
      t.text :content
      t.text :product_id

      t.timestamps
    end
  end
end
