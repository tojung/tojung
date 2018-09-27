namespace :my_tasks do
  task noti: :environment do
    puts 'Go'
    notif = Notification.all
    notif.each do |noti|
      Webpush.payload_send(
        message: { title: '제목!!', content: '내용ㅃ' }.to_json,
        endpoint: noti.endpoint,
        p256dh: noti.p256h,
        auth: noti.auth,
        ttl: 24 * 60 * 60,
        vapid: {
          subject: 'mailto:jlwhoo7@gmail.com',
          public_key: ENV['VAPID_PUBLIC_KEY'],
          private_key: ENV['VAPID_PRIVATE_KEY']
        }
      )
    end
  end
  task :te do
    puts Product.last
  end
end
