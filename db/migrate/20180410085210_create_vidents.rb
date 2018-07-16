class CreateVidents < ActiveRecord::Migration[5.1]
  def change
    create_table :vidents do |t|

      t.timestamps
    end
  end
end
