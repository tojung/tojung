class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  layout "mailer"

  def welcome_email(user_email, person_email, title, content)
    # @user = user
    @url = 'http://example.com/login'
    mail(from: user_email,
         to: person_email,
         subject: title,
         text: content
         )
  end

  def send_email_to_person(user_email, person_email, title, content, person, propose_id)
    # @user = user
    @url = 'http://example.com/login'
    @content = content
    @hashs = PersonResponse.where(person_id: person.id, propose_id: propose_id)[0]

    mail(from: user_email,
         to: person_email,
         subject: title,
         text: content
    )
  end

end