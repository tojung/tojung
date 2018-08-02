class Mainimage < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

  def createNew(param)
    self.ver_name = '버전'
    self.image0 = param[:image0]
    self.image1 = param[:image1]
    self.image2 = param[:image2]
    self.save
  end

  def setRedis
    cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"

    $redis.set('mainimage0', cdn_url + self.image0.path)
  
    $redis.set('mainimage1', cdn_url + self.image1.path)

    $redis.set('mainimage2', cdn_url + self.image2.path)
  end
end
