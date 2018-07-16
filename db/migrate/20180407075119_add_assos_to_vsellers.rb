class AddAssosToVsellers < ActiveRecord::Migration[5.1]
  def change
    add_column :vsellers, :account_assos, :text
  end
end
