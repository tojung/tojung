class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cdn_url
  skip_before_action :verify_authenticity_token
  before_action :set_token
  # acts_as_token_authentication_handler_for User

  # before_action
  # , :require_more_data

  protected
  def set_token
    unless current_user.nil?
      tokens = current_user.authentication_tokens
      if tokens.empty?
        @token = nil
        return
      end
      @token = tokens.last if tokens.last.created_at + tokens.last.expires_in < Time.now
    end
  end

  def read_user_infos
    if !current_user.nil?
      @user_email = current_user.email
      @user_id = current_user.id
    else
      @user_email = params[:email]
      @user_id = User.first.id
    end
  end

  def redirect_root
    redirect_to '/'
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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :address_num, :name, :address, :phone_number, :address_num, :address_text, :address_extra, :image0, :current_password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :address_num, :name, :address, :phone_number, :address_num, :address_text, :address_extra, :image0, :current_password) }
  end

  def custom_current_user
    body = Devise.token_generator.digest(User.first.authentication_tokens,
                                         :body,
                                         request.headers['X-USER-TOKEN'])
    token = AuthenticationToken.where(body: body)
    return nil if token.empty?
    return nil if token.last.created_at + token.last.expires_in < Time.now
    token.last.user
  end

  def authenticate_user_json!
    render json: {'error'=> 'auth error'}, status: 401 if custom_current_user.nil?
    # render json: { 'error' => 'auth error' } if custom_current_user.nil?
    return
  end
end
