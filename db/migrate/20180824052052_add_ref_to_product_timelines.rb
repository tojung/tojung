class AddRefToProductTimelines < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_timelines, :product, foreign_key: true
  end
end
