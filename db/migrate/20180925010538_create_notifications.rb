class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :endpoint
      t.string :p256h
      t.string :auth
    end
  end
end
