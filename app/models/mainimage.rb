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
end