class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :name
      t.datetime :end_time

      t.timestamps
    end
  end
end
