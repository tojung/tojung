# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    resource = warden.authenticate!(:scope => resource_name,
                                    :recall => "#{controller_path}#failure")
    token = Tiddle.create_and_return_token(resource, request, expires_in: 1.days)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :resource => resource,
                      :token => token
           }
    # render json: { authentication_token: token, user: user }
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

  private

  # this is invoked before destroy and we have to override it
  def verify_signed_out_user; end

  # def custom_current_user
  #   body = Devise.token_generator.digest(User.first.authentication_tokens,
  #                                        :body,
  #                                        request.headers['X-USER-TOKEN'])
  #   token = AuthenticationToken.where(body: body)
  #   return nil if token.empty?
  #   return nil if token.last.created_at + token.last.expires_in < Time.now
  #   token.last.user
  # end
end
