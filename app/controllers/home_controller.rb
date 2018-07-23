class HomeController < ApplicationController
  before_action :require_more_data
  def index
  end

  def about
  end

  private

  def require_more_data
    redirect_to additional_info_path unless current_user.check_user_data if user_signed_in?
  end
end
