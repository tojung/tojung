class Product < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :design_purpose, ImageUploader
  has_many :product_options, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :maker_responses, dependent: :destroy
  has_many :product_likes, dependent: :destroy
  has_many :product_timelines, dependent: :destroy
  has_many :product_orders
  has_many :product_caro_images
end
