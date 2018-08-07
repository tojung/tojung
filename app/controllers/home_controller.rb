class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]

  # GET '/' 메인 페이지
  def index; end

  # GET '/about' about 페이지
  def about; end

  private

  def image_read_or_set
    mainimage0 = $redis.get('mainimage0')
    if mainimage0.nil?
      mainimages = Mainimage.last
      if mainimages.nil?
        redirect_to '/mainimage/new'
      else
        mainimages.redis_set
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
    # noinspection RubyResolve
    if user_signed_in? and current_user.admin
      @products_unvisible = Product.where(visible: [false, 0])
    end
    @products_unvisible = Product.where(visible: [false, 0]) if admin?
  end
end
