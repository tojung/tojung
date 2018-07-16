class CreateVsellers < ActiveRecord::Migration[5.1]
  def change
    create_table :vsellers do |t|
      t.string :name

      t.timestamps
    end
  end
end
