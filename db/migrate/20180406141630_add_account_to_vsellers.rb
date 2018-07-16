class AddAccountToVsellers < ActiveRecord::Migration[5.1]
  def change
    add_column :vsellers, :account, :text
  end
end
