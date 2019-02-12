# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  respond_to :json
  # GET /resource/sign_up
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    resource.save
    if resource.errors.count != 0
      render :status => 403,
             json: {
                 :success => false,
                 :info => resource.errors.full_messages
             }
      return
    end
    token = Tiddle.create_and_return_token(resource, request, expires_in: 1.days)
    render :status => 200,
           :json => { :success => true,
                      :info => "SignUp clear!",
                      :user => current_user,
                      :token => token
           }
  end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address phone_number address_num address_text address_extra image0])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address phone_number password])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def update_resource(resource, params)
      return super if params["password"]&.present?
    resource.update_without_password(params.except("current_password"))
  end
end
