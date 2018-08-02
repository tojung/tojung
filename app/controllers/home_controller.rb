class HomeController < ApplicationController
  before_action :require_more_data, :check_admin
  before_action :set_redis_or_read, only: [:index]
  # GET '/' 메인 페이지
  def index
    # @users = $redis.get('users_json')
    # if @users.nil?
    #   print(@users)
    #   # @users = User.all 캐시에는 문자열로 저장된다.
    #   @users = User.all.to_json
    #   $redis.set('users_json', @users)
    #   $redis.exprie('users_json', 1.hour.to_i)
    # end
    @mainimage0 = $redis.get('mainimage0')
    @mainimage1 = $redis.get('mainimage1')
    @mainimage2 = $redis.get('mainimage2')

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

  def set_redis_or_read
    mainimages = Mainimage.last
    if $redis.get('mainimage0') == nil and mainimages == nil
      redirect_to '/mainimage/new'
    else
      mainimages.setRedis
    end
  end
end
