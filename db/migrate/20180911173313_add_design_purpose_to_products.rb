class AddDesignPurposeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :design_purpose, :text
  end
end
