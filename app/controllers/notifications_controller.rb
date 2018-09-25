class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def push
    if Notification.where(ip: request.env['REMOTE_ADDR']).count != 0
     jsonbody = JSON.parse request.body.read()
        render json: jsonbody
        return
    end
    jsonbody = JSON.parse request.body.read()
    endpoint = jsonbody["subscription"]["endpoint"]
    p256dh = jsonbody["subscription"]["keys"]["p256dh"]
    auth = jsonbody["subscription"]["keys"]["auth"]
    @notification = Notification.new(endpoint: endpoint, p256h: p256dh, auth: auth)
    @notification.ip = request.env['REMOTE_ADDR']
    @notification.save()

    render json: jsonbody
  end

    def message
    @notifications = Notification.all
    for notif in @notifications
     begin
       Webpush.payload_send(
           message: request.body.read(),
           endpoint: notif.endpoint,
           p256dh: notif.p256h,
           auth: notif.auth,
           ttl: 24 * 60 * 60,
           vapid: {
               subject: 'mailto:jlwhoo7@gmail.com',
               public_key: ENV['VAPID_PUBLIC'],
               private_key: ENV['VAPID_PRIVATE']
           }
       )
     rescue
     end
    end
  end
end
