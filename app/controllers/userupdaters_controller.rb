class UserupdatersController < ApplicationController
  # before_action :authenticate_user!, only: %i[ad]

  # GET /additional_info
  def additional
    # 소셜 로그인의 경우 추가로 정보를 입력하게 하는 페이지
  end

  # POST /additional_update
  def additional_update
    current_user.update_attributes(user_params)
    redirect_root
  end

  def edit
    # 정보 수정 페이지
    if params[:id] != current_user.id.to_s
      redirect_to '/'
      nil
    end
  end

  def update
    current_user.update_attributes(user_params)
    redirect_to '/home/mypage'
  end

  private

  def user_params
    params.permit(:email,
                  :address_num,
                  :phone_number,
                  :address_text,
                  :address_extra,
                  :image0)
  end
end
