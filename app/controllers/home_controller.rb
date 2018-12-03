class HomeController < ApplicationController
  before_action :require_more_data, :check_admin, :set_cdn_url
  before_action :image_read_or_set, :products_read, :set_cdn_url, only: [:index]
  before_action :authenticate_user!, only: %i[mypage]
  before_action :set_cdn_url, only: %i[index policy privacy brand mypage search best]

  # GET '/' 메인 페이지
  def index
    if params.key?(:sidebar)
      @num = params[:sidebar]
      category_list
      @products = if @num == '7' || @num == '8'
                    @products
                  else
                    @products.where(category: @category_list[@num])
                  end
    end
  end

  def search
    terms = params[:term]
    terms_cover_per = "%#{terms}%"
    if terms == '' || !terms
      @result = false
      return
    end

    @result = Product.where('name LIKE ? OR
                             subname LIKE ? OR
                             video_text LIKE ? OR
                             assos LIKE ? OR
                             bill_name LIKE ?
              ', terms_cover_per,
                            terms_cover_per,
                            terms_cover_per,
                            terms_cover_per,
                            terms_cover_per)
  end

  def categorize
    @cdn_url = 'https://d1eq7v76s8dt2n.cloudfront.net/'
    @products = Product.where(visible: [true, 1])
    @num = params[:category_id]
    category_list
    @products_categorized = if @num == '7' || @num == '8'
                              @products
                            else
                              @products.where(category: @category_list[@num])
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

  def mypage
    cal_uproduct_count
  end

  # GET '/best/:id'
  def best
    @bill = BestBill.find(params[:id])
    @footchairs = Maker.where(assos: @bill.assos)
  end

  private

  def category_list
    @category_list = { '1' => '인권/성평등',
                       '2' => '동물',
                       '3' => '육아/교육',
                       '4' => '안전/환경',
                       '5' => '보건/복지',
                       '6' => '외교/통일/국방',
                       '7' => 'HOT',
                       '8' => 'NEW' }
  end

  def cal_uproduct_count
    @ordered_product_count = 0
    uproducts = []
    current_user.product_orders.each do |product_order|
      uproducts.append(product_order.product.id) unless uproducts.include? product_order.product.id
    end
    @ordered_product_count = uproducts.length
  end

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

    if @mainimage3.nil?
      @mainimage3 = Mainimage.last.image3
      @mainimage4 = Mainimage.last.image4

      @md_link_0 = Mainimage.last.md_link0
      @md_link_1 = Mainimage.last.md_link1
    end
  end

  def products_read
    @products = Product.where(visible: [true, 1]).order(funded_count: :desc)
  end
end
