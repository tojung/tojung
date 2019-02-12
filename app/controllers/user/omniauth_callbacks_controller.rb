class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
 def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:facebook, :kakao, :google].each do |provider|
    provides_callback_for provider
  end

def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication

      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

 def kakao
	  print("go")
      @user = User.from_omniauth(request.env["omniauth.auth"])
	  print(@user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Kakao"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.kakao_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

 def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      #sign_in_and_redirect edit_user_registration_path, :event => :authentication
	    #redirect_to(edit_user_registration_path) and return
      @token = Tiddle.create_and_return_token(@user, request, expires_in: 1.days)
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
	print(params)
	print("Fail!!")
    redirect_to root_path
  end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
