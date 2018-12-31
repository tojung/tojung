class NotificationService
  def initialize(body:, ip:)
    @body = body
    @ip = ip
  end

  def push
    endpoint = @body['subscription']['endpoint']
    p256dh = @body['subscription']['keys']['p256dh']
    auth = @body['subscription']['keys']['auth']
    @notification = Notification.new(endpoint: endpoint, p256h: p256dh, auth: auth)
    @notification.ip = @ip
    @notification.save
  end
end
