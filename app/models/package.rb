class Package < ApplicationRecord
  mount_uploader :image0, ImageUploader
  has_and_belongs_to_many :product_options
  belongs_to :product
  has_many :product_orders
end
