class AddCouponUseToVtransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :vtransactions, :coupon_use, :integer
  end
end
