class BestBill < ApplicationRecord
  mount_uploader :image_0, ImageUploader
  mount_uploader :image1, ImageUploader
end