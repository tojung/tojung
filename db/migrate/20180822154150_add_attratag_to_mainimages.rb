class AddAttratagToMainimages < ActiveRecord::Migration[5.1]
  def change
    add_column :mainimages, :md_link0, :string
    add_column :mainimages, :md_link1, :string
  end
end
