class MakerController < ApplicationController
  # before_action :redirect_root_except_admin, only: %i[show]
  # GET '/maker/:maker_id?product_id='
  before_action :find_response_and_title_content, only: %i[show]
  before_action :find_maker_response, only: %i[send_mail]
  # GET '/maker/:maker_response_id'
  def show; end

  # POST '/maker/:maker_response_id/send_mail'
  def send_mail
    MakerMailer.simple_send(current_user.email,
                            @maker_response.maker.email,
                            params[:title],
                            params[:content],
                            @maker_response.agree_hash,
                            @maker_response.disagree_hash).deliver_now
    @maker_response.send_count += 1
    @maker_response.save
    Sendlog.create(from_email: current_user.email,
                   to_email: @maker_response.maker.email,
                   user_id: current_user.id,
                   content: params[:content],
                   title: params[:title]
                   )
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

    @title = "#{@maker_response.product.assos}에 계류중인
    #{@maker_response.product.bill_id}의안인
    '#{@maker_response.product.bill_name}'이 왜 통과되지않나요?"
    @content = "안녕하세요, #{@maker_response.maker.name}의원님!
#{@maker_response.product.assos}에 계류중인
    #{@maker_response.product.bill_id}의안인
   '#{@maker_response.product.bill_name}'이 왜 통과되지않는지 궁금합니다."
    if @maker_response.response_type == '무응답'
      @content += "#{@maker_response.maker.name}의원님은 이 입법안에 대해 어떤 의견을 가지고 계신가요? 이 입법을 빠르게 추진해주세요"
    elsif @maker_response.response_text.nil?
      @content += "#{@maker_response.response_type}의견을 보내주신 #{@maker_response.maker.name}의원님은 이 입법안에 대해
어떤 세부의견을 가지고계시는지 알려주세요. 이 입법을 이메일 청원합니다."
    elsif @maker_response.response_type == '찬성'
      @content = "안녕하세요 #{@maker_response.maker.name}의원님! #{@maker_response.product.assos}에 계류중인
    #{@maker_response.product.bill_id}의안인
   '#{@maker_response.product.bill_name}'에 대한 의원님의 응답에 감사드립니다. 국회에서의 신속한 진행 부탁드립니다."
    elsif @maker_response.response_type == '반대'
      @content = "안녕하세요 #{@maker_response.maker.name}의원님! #{@maker_response.product.assos}에 계류중인
    #{@maker_response.product.bill_id}의안인
   '#{@maker_response.product.bill_name}'에 대한 의원님의 응답중 이해가 되지 않는 부분이 있습니다."
    end
  end
end
