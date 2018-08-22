class CreateProductLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_likes do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.boolean :status, defalut: true
      t.timestamps
    end
  end
end
