class UserupdaterApiController < ApplicationController
  before_action :authenticate_user_json!

  def update
    custom_current_user.update_attributes(user_params)
    render json: {user: custom_current_user}
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
