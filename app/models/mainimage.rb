class Mainimage < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
   def redis_set
    cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"

    $redis.set('mainimage0', cdn_url + self.image0.path)

    $redis.set('mainimage1', cdn_url + self.image1.path)

    $redis.set('mainimage2', cdn_url + self.image2.path)
  end
end
