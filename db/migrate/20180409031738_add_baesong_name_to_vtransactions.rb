class AddBaesongNameToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :baesong_name, :text
  end
end
