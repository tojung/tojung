class AddBaesongContactToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :baesong_contact, :text
  end
end
