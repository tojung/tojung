class CreatePersonAssosDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :person_assos_details do |t|
      t.text :name
      t.integer :num
      t.text :assos
      t.text :desc1
      t.text :desc2
      t.text :desc3
      t.text :image
      t.text :image2
      t.text :image3

      t.timestamps
    end
  end
end
