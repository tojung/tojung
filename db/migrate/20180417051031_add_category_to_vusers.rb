class AddCategoryToVusers < ActiveRecord::Migration[5.1]
  def change
    add_column :vusers, :category, :text
  end
end
