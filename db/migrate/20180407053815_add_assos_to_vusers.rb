class AddAssosToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :account_assos, :text
  end
end
