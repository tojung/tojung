class Vpropose < ApplicationRecord
  mount_uploader :image, S3Uploader
  mount_uploader :goods, S3Uploader
  mount_uploader :campaign, S3Uploader
end