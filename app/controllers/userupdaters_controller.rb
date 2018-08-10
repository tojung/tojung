class UserupdatersController < ApplicationController
  before_action :require_login
  # after_action :redirect_root, only: %i[additional_update]
  # 소셜 로그인의 경우 추가로 정보를 입력하게 하는 폼
  # GET /additional_info
  def additional
    @user = current_user
  end

  # POST /additional_update
  def additional_update
    current_user.update(email: params[:email])
    current_user.update_phone(params[:phone_number])
    current_user.update_addresses(address_num: params[:address_num],
                                  address_text: params[:address_text],
                                  extra_address: params[:extra_address])
    redirect_root
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = '먼저 로그인을 해야 합니다.'
      redirect_to new_user_session_path
    end
  end
end
