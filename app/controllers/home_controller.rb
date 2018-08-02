class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :image_read_or_set, only: [:index]
  
  # GET '/' 메인 페이지
  def index
  end

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
#    mainimages = Mainimage.last
#    if $redis.get('mainimage0') == nil and mainimages == nil
#      redirect_to '/mainimage/new'
#    elsif $redis.get('mainimage0') == nil
#      mainimages.setRedis
#    else 
#      @mainimage0 = $redis.get('mainimage0')
#      @mainimage1 = $redis.get('mainimage1')
#      @mainimage2 = $redis.get('mainimage2')
#    end
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

end
