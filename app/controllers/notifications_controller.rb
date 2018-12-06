class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def push
    jsonbody = JSON.parse request.body.read()
    endpoint = jsonbody["subscription"]["endpoint"]
    p256dh = jsonbody["subscription"]["keys"]["p256dh"]
    auth = jsonbody["subscription"]["keys"]["auth"]
    @notification = Notification.new(endpoint: endpoint, p256h: p256dh, auth: auth)
    @notification.ip = request.remote_ip
    @notification.save()

    render json: jsonbody
  end
end