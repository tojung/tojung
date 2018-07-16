class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      t.text :email
      t.text :phone

      t.timestamps
    end
  end
end
