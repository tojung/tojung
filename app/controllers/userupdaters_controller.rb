class UserupdatersController < ApplicationController
  before_action :require_login

  # GET /additional_info
  def additional
  end

  # POST /additional_update
  def additional_update

    redirect_to '/'
  end

  private

  def require_login
    unless (user_signed_in?)
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end
end
