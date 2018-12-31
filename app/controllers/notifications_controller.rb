class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def push
    jsonbody = JSON.parse request.body.read

    NotificationService.new(body: jsonbody, ip: request.remote_ip).push

    render json: jsonbody
  end
end
