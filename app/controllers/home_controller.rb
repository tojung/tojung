class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]

  # GET '/' 메인 페이지
  def index


  end


  def categorize
    @cdn_url = 'https://d1eq7v76s8dt2n.cloudfront.net/'
    @products = Product.where(visible: [true, 1])
    @num = params[:category_id]
    if (@num == '1')
      @products_categorized  = @products.where(category: "인권/성평등")
    elsif @num == '2'
      @products_categorized = @products.where(category: "동물")
    elsif @num == '3'
      @products_categorized = @products.where(category: "육아/교육")
    elsif @num == '4'
      @products_categorized = @products.where(category: "안전/환경")
    elsif @num == '5'
      @products_categorized = @products.where(category: "보건/복지")
    elsif @num == '6'
      @products_categorized = @products.where(category: "외교/통일/국방")
    respond_to do |format|
      format.js { render :locals => { :products_categorized => @products_categorized } }
    end
    end

  end

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

  # noinspection RubyResolve
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
