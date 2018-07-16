class CreateVcategoryimages < ActiveRecord::Migration[5.1]
  def change
    create_table :vcategoryimages do |t|
      t.text :name
      t.text :bg_category_name
      t.text :sm_category_name
      t.text :image

      t.timestamps
    end
  end
end
