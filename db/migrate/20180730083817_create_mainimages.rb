class CreateMainimages < ActiveRecord::Migration[5.1]
  def change
    create_table :mainimages do |t|
      t.text :image0, default: ''
      t.text :image1, default: ''
      t.text :image2, default: ''
      t.text :ver_name, default: ''

      t.timestamps
    end
  end
end
