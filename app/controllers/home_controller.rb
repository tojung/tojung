class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]

  # GET '/' 메인 페이지
  def index; end

  # GET '/about' about 페이지
  def about; end

  private

  # noinspection RubyResolve
  def require_more_data
    redirect_to additional_info_path if user_signed_in? && !current_user.check_user_data
  end

  def image_read_or_set
    mainimage0 = $redis.get('mainimage0')
    if mainimage0.nil?
      mainimages = Mainimage.last
      mainimages.nil? ? redirect_to '/mainimage/new' : mainimages.setRedis
    else
      @mainimage0 = $redis.get('mainimage0')
      @mainimage1 = $redis.get('mainimage1')
      @mainimage2 = $redis.get('mainimage2')
    end
  end

  # noinspection RubyResolve
  def products_read
    # Redis 적용 예정
    @products = Product.where(visible: [true, 1])
    @products_unvisible = Product.where(visible: [false, 0]) if user_signed_in? and current_user.admin
  end

end
