class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.text :name

      t.timestamps
    end
  end
end
