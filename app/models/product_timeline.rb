class ProductTimeline < ApplicationRecord
    mount_uploader :image0, ImageUploader
    belongs_to :product
end
