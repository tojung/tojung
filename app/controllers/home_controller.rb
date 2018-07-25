class HomeController < ApplicationController
  before_action :require_more_data
  def index
    print("Hello World")
    users = $redis.get('users')
    if users.nil?
      @users = User.all
      $redis.set("users", @users)
      $redis.exprie('users', 1.hour.to_i)
    end
  end

  def about
  end

  private

  def require_more_data
    redirect_to additional_info_path unless current_user.check_user_data if user_signed_in?
  end
end
