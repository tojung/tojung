class Product < ApplicationRecord
  mount_uploader :image0, ImageUploader
  mount_uploader :image1, ImageUploader
  has_many :product_options, dependent: :destroy
  has_many :packages, dependent: :destroy

  def createNew(params)
    self.name    = params[:title]
    self.subname = params[:subtitle]
    self.start_date = params[:start_date]
    self.end_date = params[:end_date]
    self.youtb_url = params[:youtb_url]
    self.video_text = params[:youtb_content]
    self.bill_url = params[:bill_url]
    self.assos = params[:assos]
    self.category = assos
    self.fb_url = params[:fb_url]
    self.image0 = params[:image0]
    self.goal_money = params[:goal_money]
    save
  end

  def updateNormal(params)
    self.name = params[:title]
    self.subname = params[:subtitle]
    self.youtb_url = params[:youtb_url]
    self.video_text = params[:youtb_content]
    self.assos = params[:assos]
    self.category = assos
    self.fb_url = params[:fb_url]
    self.goal_money = params[:goal_money]
    self.bill_url = params[:bill_url]
    save
  end

  def updateImage0(params)
    self.image0 = params[:image0]
    save
  end

  def updateImage1(params)
    self.image1 = params[:image1]
    save
  end

  def createProductOption(params)
    p = product_options.new
    p.name = params[:name]
    p.image0 = params[:image0]
    p.image1 = params[:image1]
    p.content = params[:content]
    p.status = '판매중'
    p.price = params[:price].to_i
    p.remain_count = params[:remain_count]
    p.save
  end

  def reverse_visible
    self.visible = (visible == 0 ? true : !visible)
    save
  end
end
