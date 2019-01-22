class AddGoodsDiliveryDateSToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :goods_dilivery_date_s, :string
  end
end
