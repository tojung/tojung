class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :package
  has_one :product_order_detail
  has_one :product_delivery
end