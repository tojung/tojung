class AddAttr22ToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :goods_dilivery_date, :datetime
  end
end
