class HomeController < ApplicationController
  before_action :require_more_data, :check_admin, :set_cdn_url
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]
  before_action :authenticate_user!, only: %i[mypage]
  before_action :set_cdn_url, only: %i[index policy privacy brand mypage]
  # GET '/' 메인 페이지
  def index
    if params.key?(:sidebar)
      @num = params[:sidebar]
      if @num == '1'
        @products = @products.where(category: '인권/성평등')
      elsif @num == '2'
        @products = @products.where(category: '동물')
      elsif @num == '3'
        @products = @products.where(category: '육아/교육')
      elsif @num == '4'
        @products = @products.where(category: '안전/환경')
      elsif @num == '5'
        @products = @products.where(category: '보건/복지')
      elsif @num == '6'
        @products = @products.where(category: '외교/통일/국방')
      elsif @num == '7'
        @products = @products
      elsif @num == '8'
        @products = @products
      end
    end
  end

  def categorize
    @cdn_url = 'https://d1eq7v76s8dt2n.cloudfront.net/'
    @products = Product.where(visible: [true, 1])
    @num = params[:category_id]
    if @num == '1'
      @products_categorized = @products.where(category: '인권/성평등')
    elsif @num == '2'
      @products_categorized = @products.where(category: '동물')
    elsif @num == '3'
      @products_categorized = @products.where(category: '육아/교육')
    elsif @num == '4'
      @products_categorized = @products.where(category: '안전/환경')
    elsif @num == '5'
      @products_categorized = @products.where(category: '보건/복지')
    elsif @num == '6'
      @products_categorized = @products.where(category: '외교/통일/국방')
    elsif @num == '7'
      @products_categorized = @products
    elsif @num == '8'
      @products_categorized = @products
      respond_to do |format|
        format.js { render locals: { products_categorized: @products_categorized } }
      end
    end
  end

  def sidebar_categorize
    redirect_to root_path(sidebar: params[:id])
  end

  # GET '/about' about 페이지
  def about; end

  def privacy; end

  def policy; end

  def brand; end

  def mypage; end

  private

  def image_read_or_set
    mainimage0 = $redis.get('mainimage0')
    if mainimage0.nil?
      mainimages = Mainimage.last
      if mainimages.nil?
        redirect_to '/admin'
      else
        mainimages.redis_set
      end
    else
      @mainimage0 = $redis.get('mainimage0')
      @mainimage1 = $redis.get('mainimage1')
      @mainimage2 = $redis.get('mainimage2')
      
      @mainimage3 = $redis.get('mainimage3')
      @mainimage4 = $redis.get('mainimage4')
      
      @md_link0 = $redis.get('md_link0')
      @md_link1 = $redis.get('md_link1')
    end

    if @mainimage3 == nil
        @mainimage3 = Mainimage.last.image3
        @mainimage4 = Mainimage.last.image4

        @md_link_0 = Mainimage.last.md_link0
        @md_link_1 = Mainimage.last.md_link1
    end 
  end

  # noinspection RubyResolve
  def products_read
    # Redis 적용 예정
    @products = Product.where(visible: [true, 1])
    # noinspection RubyResolve
    if user_signed_in? && current_user.admin
      @products_unvisible = Product.where(visible: [false, 0])
    end
    @products_unvisible = Product.where(visible: [false, 0]) if admin?
  end
end
