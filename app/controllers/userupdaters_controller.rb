class UserupdatersController < ApplicationController
  before_action :require_login

  # GET /additional_info
  def additional
    @user = current_user
  end

  # POST /additional_update
  def additional_update
    current_user.update(email: params[:email])
    current_user.update_phone(params[:phone])
    current_user.update_addresses(address_num: params[:address_num],
                                  address_text: params[:address_text],
                                  extra_address: params[:extra_address])
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to new_user_session_path
    end
  end
end
