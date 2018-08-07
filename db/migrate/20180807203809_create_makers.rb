class CreateMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers do |t|
      t.text :name
      t.integer :num
      t.text :assos
      t.text :desc1
      t.text :desc2
      t.text :desc3
      t.text :image0
      t.text :image1
      t.text :image2
      t.text :email
      t.text :email2
      t.timestamps
    end
  end
end
