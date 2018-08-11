class Mainimage < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
end