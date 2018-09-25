notif = Notification.last
Webpush.payload_send(
           message: "Hello World!!",
           endpoint: notif.endpoint,
           p256dh: notif.p256h,
           auth: notif.auth,
           ttl: 24 * 60 * 60,
           vapid: {
               subject: 'mailto:jlwhoo7@gmail.com',
               public_key: ENV['VAPID_PUBLIC_KEY'],
               private_key: ENV['VAPID_PRIVATE_KEY']
           }
       )
