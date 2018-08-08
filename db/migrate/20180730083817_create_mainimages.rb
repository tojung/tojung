class CreateMainimages < ActiveRecord::Migration[5.1]
  def change
    create_table :mainimages do |t|
      t.text :image0
      t.text :image1
      t.text :image2
      t.text :ver_name

      t.timestamps
    end
  end
end
