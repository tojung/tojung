class MakerJob < ApplicationJob
  queue_as :tojung_mailer

  def perform(from_email,
              to_email,
              title,
              content,
              agree_hash,
              disagree_hash)    # Do something later
    MakerMailer.simple_send(from_email,
                            to_email,
                            title,
                            content,
                            agree_hash,
                            disagree_hash).deliver
    Maker.create(name: "error!!")
  end
end
