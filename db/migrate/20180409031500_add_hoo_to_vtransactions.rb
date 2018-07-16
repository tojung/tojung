class AddHooToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :hoo, :integer
  end
end
