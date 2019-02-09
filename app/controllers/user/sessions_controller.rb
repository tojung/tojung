# frozen_string_literal: true
class User::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :user => current_user
           }
  end

  def destroy
    sign_out(resource_name)
    # signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out"
           }
  end
end
