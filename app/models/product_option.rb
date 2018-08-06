class ProductOption < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  belongs_to :product

  def updateOption(params)
    self.name = params[:name]
    self.image0 = params[:image0]
    self.image1 = params[:image1]
    self.content = params[:content]
    self.status = params[:status]
    self.price = params[:price].to_i
    self.remain_count = params[:remain_count]
    self.save
  end
end
