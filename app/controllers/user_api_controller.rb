class UserApiController < ApplicationController
  before_action :authenticate_user_json!
  def check_token
    render json: { "success": true,
                   "msg": "user is sign_in",
                   user: custom_current_user }
  end
end
