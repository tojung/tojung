class Product < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  has_many :product_options, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :maker_responses, dependent: :destroy
end