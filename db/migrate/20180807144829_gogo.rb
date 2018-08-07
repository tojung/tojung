class Gogo < ActiveRecord::Migration[5.1]
  def change
    create_join_table :packages, :product_options do |t|
      # t.index [:package_id, :product_option_id]
      # t.index [:product_option_id, :package_id]
    end
  end
end
