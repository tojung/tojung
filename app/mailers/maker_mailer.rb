#require 'mail'
class MakerMailer < ApplicationMailer
  def simple_send(from_email, to_email, title, content, agree_hash, disagree_hash)
    @content = content
    @agree_hash = agree_hash
    @disagree_hash = disagree_hash
    tojung = "tojung"
    #from = %("#{tojung}" <#{from_email}>)
    #to = %("#{tojung}" <#{to_email}>)
    #to = Mail::Address.new to_email
    to = "\"#{tojung}\" <#{to_email}>"
    mail(to: to.format,
         subject: title)
  end
end
