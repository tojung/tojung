class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cdn_url
  protected

  # noinspection RubyResolve
  def check_admin
    @is_admin = admin?
  end

  # noinspection RubyResolve
  def redirect_root_except_admin
    redirect_root if !user_signed_in? || !current_user.admin
  end

  def redirect_root
    # noinspection RubyUnnecessaryReturnStatement
    return redirect_to '/'
  end

  def redirect_root_except_visible
    redirect_root_except_admin unless @product.visible
  end

  def set_cdn_url
    @cdn_url = 'https://d1eq7v76s8dt2n.cloudfront.net/'
  end

  # noinspection RubyResolve
  def require_more_data
    redirect_to additional_info_path if user_signed_in? && !current_user.check_user_data
  end

  def admin?
    # noinspection RubyResolve,RubyDeadCode
    user_signed_in? && current_user.admin?
  end

  def redirect_ready_page
    redirect_to "/product/ready/#{@product.id}"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :address_num, :name, :address, :phone_number, :address_num, :address_text, :address_extra, :image0, :current_password) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :address_num, :name, :address, :phone_number, :address_num, :address_text, :address_extra, :image0, :current_password) }
end


end
