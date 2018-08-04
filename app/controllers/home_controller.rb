class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]

  # GET '/' 메인 페이지
  def index; end

  # GET '/about' about 페이지
  def about; end

  private

  def require_more_data
    redirect_to additional_info_path if user_signed_in? && !current_user.check_user_data
  end

  def check_admin
    @is_admin = current_user.admin if user_signed_in?
  end

  def image_read_or_set
    mainimage0 = $redis.get('mainimage0')
    if mainimage0 == nil
      mainimages = Mainimage.last
      if mainimages == nil
        redirect_to '/mainimage/new'
      else
        mainimages.setRedis
      end
    else
      @mainimage0 = $redis.get('mainimage0')
      @mainimage1 = $redis.get('mainimage1')
      @mainimage2 = $redis.get('mainimage2')
    end
  end

  def products_read
    # Redis 적용 예정
    @products = Product.where(visible: [true, 1])
    if user_signed_in? and current_user.admin
      @products_unvisible = Product.where(visible: [false, 0])
    end
  end

  def set_cdn_url
    @cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"
  end
end
