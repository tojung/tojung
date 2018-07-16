class ApplicationController < ActionController::Base
  # before_action :authenticate_vuser!
 #  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception
end
