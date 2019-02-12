class UserApiController < ApplicationController
  before_action :authenticate_user_json!
  def check_token
    res = custom_current_user.as_json
    res['ordered_product_count'] = CalculateService
                                   .user_ordered_product_count(user: custom_current_user)
    render json: { "success": true,
                   "msg": 'user is sign_in',
                   user: res }
  end
end
