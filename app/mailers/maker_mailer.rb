require 'mail'
class MakerMailer < ApplicationMailer
  def simple_send(from_email, to_email, title, content, agree_hash, disagree_hash)
    @content = content
    @agree_hash = agree_hash
    @disagree_hash = disagree_hash
    to = to_email
    to.sub! "\n", ""
    mail(to: to,
         subject: title)
  end
end
