class StaticValueService
  def initialize; end

  def jelleycases
    @jellycases = ['아이폰 5/5S/5SE', '아이폰 6/6S', '아이폰6+/6S+', '아이폰7', '아이폰7+', '아이폰8', '아이폰8+', '아이폰X', '아이폰XS', '아이폰XR',
                   '갤럭시S3', '갤럭시S4', '갤럭시S5', '갤럭시S6', '갤럭시S6엣지', '갤럭시S6엣지+', '갤럭시S7', '갤럭시S7엣지', '갤럭시S8', '갤럭시S8+',
                   '갤럭시S9', '갤럭시S9+', '갤럭시노트3', '갤럭시노트4', '갤럭시노트5', '갤럭시노트7', '갤럭시노트8', '갤럭시J5(2015)', '갤럭시J7(2015)',
                   '갤럭시A8(2015)', '갤럭시A5(2016)', '갤럭시A7(2016)', '갤럭시A5(2017)', '갤럭시A7(2017)', '갤럭시A8(2018)', '갤럭시그랜드맥스',
                   '갤럭시그랜드맥스2', '갤럭시 알파', 'LG G3(CAT,6)', 'LG G4', 'LG G5', 'LG G6', 'LG G7', 'LG V10', 'LG V20', 'LG V30']
  end

  def hardcases
    @hardcases = ['아이폰 4/4S', '아이폰 5C', '아이폰 5/5S/5E', '아이폰 6/6S(4.7인치)', '아이폰 6/6S+', '아이폰7', '아이폰7+', '아이폰8', '아이폰8+', '아이폰X', '아이폰XS', '아이폰XR',
                  '갤럭시S2', '갤럭시S3', '갤럭시S4', '갤럭시S4미니', '갤럭시S5', '갤럭시S6', '갤럭시S6엣지', '갤럭시S6엣지+', '갤럭시S7', '갤럭시S7엣지', '갤럭시S8', '갤럭시S8+', '갤럭시S9',
                  '갤럭시S9+', '갤럭시A5(2015)', '갤럭시A7(2015)', '갤럭시A8(2015)', '갤럭시A5(2016)', '갤럭시A7(2016)', '갤럭시A5(2017)', '갤럭시A8(2018)', '갤럭시노트1', '갤럭시노트2',
                  '갤럭시노트3', '갤럭시노트4', '갤럭시노트4엣지', '갤럭시노트5', '갤럭시노트7/FE', '갤럭시노트8', 'LG 옵티머스G', 'LG G2', 'LG G3', 'LG G4', 'LG G5', 'LG G6', 'LG G7', '옵티머스 GPRO',
                  '옵티머스 GPRO2', 'LG V10', 'LG V20', 'LG V30', '베가 아이언2', '베가 시크릿노트']
  end

  def category_list
    @category_list = { '1' => '인권/성평등',
                       '2' => '동물',
                       '3' => '육아/교육',
                       '4' => '안전/환경',
                       '5' => '보건/복지',
                       '6' => '외교/통일/국방',
                       '7' => 'HOT',
                       '8' => 'NEW' }
  end

  def mail_title(maker_response:)
    title = "#{maker_response.product.assos}에 계류중인
    #{maker_response.product.bill_id}의안인
    '#{maker_response.product.bill_name}'이 왜 통과되지않나요?"

    title
  end

  def mail_content(maker_response: )
    content = "안녕하세요, #{maker_response.maker.name}의원님!
#{maker_response.product.assos}에 계류중인
    #{maker_response.product.bill_id}의안인
   '#{maker_response.product.bill_name}'이 왜 통과되지않는지 궁금합니다."

    if maker_response.response_type == '무응답'

      content += "#{maker_response.maker.name}의원님은 이 입법안에 대해 어떤 의견을 가지고 계신가요? 이 입법을 빠르게 추진해주세요"

    elsif maker_response.response_text.nil?

      content += "#{maker_response.response_type}의견을 보내주신 #{maker_response.maker.name}의원님은 이 입법안에 대해 \n어떤 세부의견을 가지고계시는지 알려주세요. 이 입법을 이메일 청원합니다."

    elsif maker_response.response_type == '찬성'

      content = "안녕하세요 #{maker_response.maker.name}의원님! #{maker_response.product.assos}에 계류중인
    #{maker_response.product.bill_id}의안인
   '#{maker_response.product.bill_name}'에 대한 의원님의 응답에 감사드립니다. 국회에서의 신속한 진행 부탁드립니다."

    elsif maker_response.response_type == '반대'

      content = "안녕하세요 #{maker_response.maker.name}의원님! #{maker_response.product.assos}에 계류중인
    #{maker_response.product.bill_id}의안인
   '#{maker_response.product.bill_name}'에 대한 의원님의 응답중 이해가 되지 않는 부분이 있습니다."

    end

    content
  end
end
