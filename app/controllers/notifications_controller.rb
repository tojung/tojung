class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def push
    jsonbody = JSON.parse request.body.read()
    endpoint = jsonbody["subscription"]["endpoint"]
    p256dh = jsonbody["subscription"]["keys"]["p256dh"]
    auth = jsonbody["subscription"]["keys"]["auth"]
    @notification = Notification.new(endpoint: endpoint, p256h: p256dh, auth: auth)
    @notification.save()
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
