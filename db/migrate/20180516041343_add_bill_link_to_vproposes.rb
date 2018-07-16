class AddBillLinkToVproposes < ActiveRecord::Migration[5.1]
  def change
    add_column :vproposes, :bill_link, :text
  end
end
