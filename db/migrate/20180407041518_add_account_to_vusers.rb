class AddAccountToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :account, :text
  end
end
