class ProductOption < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  belongs_to :product
  has_and_belongs_to_many :packages
end