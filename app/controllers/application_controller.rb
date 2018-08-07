class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cdn_url

  protected

  def check_admin
    @is_admin = current_user.admin if user_signed_in?
  end

  def redirect_root_without_admin
    redirect_to '/' if !(user_signed_in?) or !(current_user.admin)
  end

  def set_cdn_url
    @cdn_url = "http://d1eq7v76s8dt2n.cloudfront.net/"
  end
end