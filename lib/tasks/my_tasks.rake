namespace :my_tasks do
  task noti: :environment do
    puts 'Go'
    notif = Notification.all
    notif.each do |noti|
      begin
      Webpush.payload_send(
        message: { title: '제목!!', content: '내용ㅃ' }.to_json,
        endpoint: noti.endpoint,
        p256dh: noti.p256h,
        auth: noti.auth,
        ttl: 24 * 60 * 60,
        vapid: {
          subject: 'mailto:geniuslim27@gmail.com',
          public_key: ENV['VAPID_PUBLIC_KEY'],
          private_key: ENV['VAPID_PRIVATE_KEY']
        }
      )
     rescue
     end
    end
  end
  task :te do
    puts Product.last
  end
end