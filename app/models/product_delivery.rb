class ProductDelivery < ApplicationRecord
  has_one :product_order
end
