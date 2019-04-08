class CreateRecommends < ActiveRecord::Migration[5.1]
  def change
    create_table :recommends do |t|
      t.integer :count

      t.timestamps
    end
  end
end
