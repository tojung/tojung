class MakerController < ApplicationController
  before_action :authenticate_user!, only: [:send_mail]

  def show
    find_response_and_title_content
  end

  # POST '/maker/:maker_response_id/send_mail'
  def send_mail
    find_maker_response
    send
    logging
    redirect_to "/product/#{@maker_response.product.id}"
  end

  # POST
  def push_to_maker; end

  private

  def find_maker_response
    @maker_response = MakerResponse.find(params[:maker_response_id])
  end

  def find_response_and_title_content
    find_maker_response
    service = StaticValueService.new
    @title = service.mail_title(maker_response: @maker_response)
    @content = service.mail_content(maker_response: @maker_response)
  end

  def send
    MakerMailer.simple_send(current_user.email,
                            @maker_response.maker.email,
                            params[:title],
                            params[:content],
                            @maker_response.agree_hash,
                            @maker_response.disagree_hash).deliver_now
    @maker_response.send_count += 1
    @maker_response.save
  end

  def logging
    Sendlog.create(from_email: current_user.email,
                   to_email: @maker_response.maker.email,
                   user_id: current_user.id,
                   content: params[:content],
                   title: params[:title])
  end
end
