class MakerResponseService
  def initialize(content:, user_email:, user_id:, product:)
    @content = content
    @user_email = user_email
    @user_id = user_id
    @product = product
  end

  def sends
    @product.maker_responses.each do |maker_res|
      begin
        generate_message(maker_res)
        send_async(maker_res)
        count_up(maker_res)
        logging(maker_res)
      rescue StandardError => error
        puts error.full_message
      end
    end
  end

  private

  def logging(maker_res)
    Sendlog.create(from_email: @user_email,
                   to_email: maker_res.maker.email,
                   user_id: @user_id,
                   content: @content,
                   title: "#{@product.assos}에 계류중인 #{@product.bill_id}의안인 '#{@product.bill_name}'이 왜 통과되지않나요?")
  end

  def count_up(maker_res)
    maker_res.send_count += 1
    maker_res.save
  end

  def generate_message(maker_res)
    @message = "안녕하세요, #{maker_res.maker.name}의원님!
#{maker_res.product.assos}에 계류중인
#{maker_res.product.bill_id}의안인
          '#{maker_res.product.bill_name}'이 왜 통과되지않는지 궁금합니다.의원님은 이 입법안에 대해 어떤 의견을 가지고 계시나요? 이 입법을 꼭 빠르게 추진해주세요.
이메일 청원합니다.\n\n#{@content}"
  end

  def send_async(maker_res)
    MakerMailer.simple_send(@user_email,
                            maker_res.maker.email,
                            "#{@product.assos}에 계류중인 #{@product.bill_id}의안인 '#{@product.bill_name}'이 왜 통과되지않나요?",
                            @content,
                            maker_res.agree_hash,
                            maker_res.disagree_hash).deliver_later
  end
end