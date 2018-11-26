class MakerMailer < ApplicationMailer
  def simple_send(from_email, to_email, title, content, agree_hash, disagree_hash)
    @content = content
    @agree_hash = agree_hash
    @disagree_hash = disagree_hash
    from = %("#{tojung}" <#{from_email}>)
    to = %("#{tojung}" <#{to_email}>)
    mail(from: from,
         to: to,
         subject: title)
  end
end
