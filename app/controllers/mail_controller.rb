class MailController < ApplicationController
  def index
    Maker.create(name: params.to_s)
  end
end
