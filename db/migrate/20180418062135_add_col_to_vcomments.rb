class AddColToVcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :vcomments, :propose_id, :integer
  end
end
