class NoticeService
  def initialize; end

  def read_notices
    Notice.where(end_time: Time.now..(Time.now + 300.days))
  end
end