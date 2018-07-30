class HomeController < ApplicationController
  before_action :require_more_data
  def index
    print("Hello World")
    @users = $redis.get('users_json')
    if @users.nil?
      print(@users)
      # @users = User.all 캐시에는 문자열로 저장된다.
      @users = User.all.to_json
      $redis.set("users_json", @users)
      $redis.exprie('users_json', 1.hour.to_i)
    end
  end

  def about
  end

  private

  def require_more_data
    redirect_to additional_info_path unless current_user.check_user_data if user_signed_in?
  end
end
