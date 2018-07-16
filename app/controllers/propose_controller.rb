# noinspection ALL
class ProposeController < ApplicationController
  # GET /propose/:id/subcribe
  def subscribe_form
    @propose = Vpropose.find(params[:id].to_i)
  end

  # POST /propose/:id/subscribe
  def subscribe
    @propose = Vpropose.find(params[:id].to_i)
    subscribe = Subscribe.new
    subscribe.email = params[:email]
    subscribe.phone = params[:phone]
    subscribe.propose_id = params[:id]
    subscribe.save

    if @propose.subscribe_count == nil
      @propose.subscribe_count = 0
    end
    @propose.subscribe_count += 1
    @propose.save
    redirect_to '/propose/'+params[:id]
  end

  # GET /propose/:id/email/:person_id
  def email_form
    @propose = Vpropose.find(params[:id].to_i)
    @person = Person.find(params[:person_id].to_i)
    @person_res = PersonResponse.where(propose_id: params[:id],
                                       person_id: params[:person_id])[0]
    @person_detail = PersonAssosDetail.find_by_name(@person.name)
  end
  
  # POST /propose/:id/email/:person_id
  def email_send
    person = Person.find(params[:person_id])
    person_email = ""
    if person.email == "x" or person.email == nil or person.email == ""
      if person.emaill == "x" or person.emaill == nil or person.emaill == ""
        person_email = person.email2
      else
        person_email = person.emaill
      end
    else
       person_email = person.email
    end

    if person_email == "" or person_email == "x" or person_email == nil
      redirect_to '/'
      return 
    end

    person_email = person_email.remove("\n")
    content =  params[:content]
    UserMailer.send_email_to_person(params[:user_email],
                             person_email,
                             params[:title],
                             content, person, params[:id]).deliver_now

    person_res = PersonResponse.where(propose_id: params[:id],
                                      person_id: params[:person_id])[0]

    person_res.send_count = (person_res.send_count.to_i + 1).to_s
    person_res.save
    @propose = Vpropose.find(params[:id])

    if @propose.send_count == nil
      @propose.send_count = 0
    end
    @propose.send_count += 1
    @propose.save
    
    email_send_log = Esendlog.new
    email_send_log.propose_id = params[:id]
    email_send_log.person_id = person.id 
    email_send_log.from_email = params[:user_email]
    email_send_log.to_email = person_email
    email_send_log.title = params[:title] 
    email_send_log.content = content 
    email_send_log.save 

    print(content)
    redirect_to '/propose/' + params[:id]
  end

  # GET /propose/index
  def index
    # 청원 목록 페이지 ( 테스트용 )
    @proposes = Vpropose.all
  end

  # GET /propose/:id
  def detail
    @base_url = request.base_url
    @propose = Vpropose.find(params[:id].to_i)

    @propose.save

    @writer = Vuser.find(@propose.user_id)

    @result = {}

    @result['propose'] = {}
    @result['propose']['object'] = @propose
    @result['propose']['writer'] = Vuser.find(@propose.user_id)

    if !@result['propose']['object'].image.url.nil?
      print('not nil')
      @result['image'] = @result['propose']['object'].image.url
    else
      print('nil')
      @result['image'] = @result['propose']['object'].default_image
      print(@result['image'])
    end
    @is_admin = false
    if current_vuser == Vuser.find_by_email("admin@2jung.com")
      @is_admin = true
    end
    # Person.find_by_assos()
    @people = Person.where('shrtnm like ?', "%#{@propose.assos}%")

    @people_res = {}
    @people.each do |person|
      person_response = PersonResponse.where(propose_id: @propose.id, person_id: person.id)
      if person_response.count.zero?
        person_response = PersonResponse.create(name: person.name,
                                                person_id: person.id,
                                                response_type: '무응답',
                                                response_text: '',
                                                send_count: 0,
                                                propose_id: @propose.id,
                                                agree_hash: SecureRandom.base64(50),
                                                disagree_hash: SecureRandom.base64(50)
                                                )
      else
        person_response = person_response[0]
        if person_response.agree_hash == nil
          person_response.agree_hash = SecureRandom.base64(50)
        end
        if person_response.disagree_hash == nil
          person_response.disagree_hash = SecureRandom.base64(50)
        end
      end

      @people_res[person.id] = person_response
      person_response.save
    end
	
	@test = Person.find_by_name("test")
	@testRes = PersonResponse.where(propose_id: @propose.id, person_id: @test.id)
	if @testRes.count.zero?
		@testRes = PersonResponse.create(name: @test.name, 
										 person_id: @test.id,
										 response_type: '무응답',
										 send_count: 0, 
										 propose_id: @propose.id,
										 agree_hash: SecureRandom.base64(50),
										 disagree_hash: SecureRandom.base64(50),
										)
	else
		@testRes = @testRes[0]
	end

  end

  # GET /propose/new
  def new
    # 생성 페이지
    if current_vuser == nil
      redirect_to '/'
      return
    end
    if current_vuser != Vuser.find_by_email('admin@2jung.com')
      redirect_to '/'
      return
    end
  end

  # GET /propose/edit/:id
  def edit
    if current_vuser.nil?
      redirect_to '/'
      return
    end

    if current_vuser != Vuser.find_by_email('admin@2jung.com')
      redirect_to '/'
      return
    end

    @propose = Vpropose.find(params[:id])
  end

  # POST /propose
  def create
    # 청원 생성 액션 및 약정 생성 액션

    if current_vuser.nil?
      redirect_to '/'
      return
    end
    if current_vuser != Vuser.find_by_email('admin@2jung.com')
      redirect_to '/'
      return
    end

    # 청원 생성
    @propose = Vpropose.new

    @propose.title   = params[:propose_title]   # 제목
    @propose.content = params[:propose_content] # 내용
    @propose.assos = params[:assos] # 상임위

    @propose.bill_id = params[:bill_id] # 법안 ID
    @propose.bill_name = params[:bill_name] # 법안 제목

    @propose.image   = params[:propose_image]   # 대표사진
    @propose.goods   = params[:goods]           # 굿즈 이미지
    @propose.campaign = params[:campaign]       # 캠페인 이미지

    @propose.campaign_content = params[:campaign_content] # 캠페인 설명
    @propose.bill_link = params[:bill_link] # 법안 링크
    @propose.tumb = params[:tumb] # 텀블벅 링크

    @propose.user_id = current_vuser.id

    @propose.status  = '펀딩진행중'

    @propose.funded_money = 0
    @propose.goal_money = 10_000_000
    @propose.funded_num = 1
    @propose.send_count = 0
    @propose.subscribe_count = 0

    @propose.save

    redirect_to '/propose/' + @propose.id.to_s
  end


  # PATCH /propose/:id
  def update
    if current_vuser != Vuser.find_by_email('admin@2jung.com')
      redirect_to '/'
      return
    end

    @propose = Vpropose.find(params[:id].to_i)

    @propose.title   = params[:propose_title]   # 제목
    @propose.content = params[:propose_content] # 내용
    @propose.assos = params[:assos] # 상임위

    @propose.bill_id = params[:bill_id] # 법안 ID
    @propose.bill_name = params[:bill_name] # 법안 제목
    print("========================\n")
    print(@propose.bill_id)
    print(@propose.bill_name)
    @propose.image   = params[:propose_image]   # 대표사진
    @propose.goods   = params[:goods]           # 굿즈 이미지
    @propose.campaign = params[:campaign]       # 캠페인 이미지

    @propose.campaign_content = params[:campaign_content] # 캠페인 설명
    @propose.bill_link = params[:bill_link] # 법안 링크
    @propose.tumb = params[:tumb] # 텀블벅 링크

    @propose.save
    print(@propose)
    redirect_to '/propose/' + @propose.id.to_s
  end
end
