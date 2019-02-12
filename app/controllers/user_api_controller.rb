class UserApiController < ApplicationController
  before_action :authenticate_user_json!
  def check_token
    render json: { "success": true, "msg": "user is sign_in" }
  end
end
