class UserApiController < ApplicationController
  before_action :authenticate_user_json!
  def check_token
    res = UserSerializerService.new(custom_current_user).include_all
    render json: { "success": true,
                   "msg": 'user is sign_in',
                   user: res }
  end
end
