class Product < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader

  def createNew(params)
    print(params)
    self.name    = params[:title]
    self.subname = params[:subtitle]
    self.start_date = params[:start_date]
    self.end_date = params[:end_date]
    self.youtb_url = params[:youtb_url]
    self.video_text = params[:youtb_content]
    self.bill_url = params[:bill_url]
    self.assos = params[:assos]
    self.category = self.assos
    self.fb_url = params[:fb_url]
    self.image0 = params[:image0]
    self.goal_money = params[:goal_money]
    self.save
  end
end