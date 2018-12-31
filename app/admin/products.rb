ActiveAdmin.register Product do
  menu label: '법안 상품'
  permit_params :name,
                :subname,
                :start_date,
                :youtb_url,
                :end_date,
                :video_text,
                :bill_url,
                :funded_money,
                :funded_count,
                :assos,
                :fb_url,
                :image0,
                :image1,
                :goal_money,
                :category,
                :visible,
                :bill_id,
                :bill_name,
                :status, :goods_dilivery_date, :design_purpose
  show do
    panel '법안상품' do
      table_for product i18n: Product do
        column 'id'
        column '법안상품 이름', :name
        column '부제목', :subname
        column '메인이미지', :image0 do |product|
          image_tag product.image0, style: 'width: 30%'
        end
        column '패키지정리이미지', :image1 do |product|
          image_tag product.image1, style: 'width: 30%'
        end
      end

      table_for product i18n: Product do |_product|
        column '법안 번호', :bill_id
        column '법안 링크', :bill_url
        column '법안 이름', :bill_name
        column '상임위 이름', :assos
        column '카테고리', :category
      end

      table_for product i18n: Product do |_product|
        column '펀딩 금액', :funded_money
        column '펀딩 참여 수', :funded_count
        column '목표 금액', :goal_money
      end

      table_for product i18n: Product do |_product|
        column '시작일', 'start_date'
        column '종료일', 'end_date'
        column '페북그룹주소', 'fb_url'
        column '유튜브영상주소', :youtb_url
        column '영상설명', :video_text
        column '공개여부', :visible
      end
    end
  end

  index do
    selectable_column
    column '법안상품이름' do |product|
      link_to product.name, admin_product_path(product)
    end
    column '부제목', :subname
    column '이미지', :image0 do |product|
      image_tag(product.image0, style: 'width: 30%;')
    end
    column '펀딩금액', :funded_money
    column '펀딩수', :funded_count
    column '법안 주소', :bill_url
    column '소관위', :assos
    column '페북그룹주소', :fb_url
  end

  form title: '법안 상품 추가/수정 하기' do |_f|
    inputs 'Details' do
      input 'name', label: '법안 상품 이름'
      input 'subname', label: '부 제목'
      input 'category', label: '카테고리'

      input 'youtb_url', label: '유튜브 주소'
      input 'video_text', label: '유튜브 영상 설명'

      input 'fb_url', label: '페이스북 그룹 주소'

      input 'start_date', as: :datepicker,
                          datepicker_options: {
                            min_date: '2018-08-08',
                            max_date: '+9D'
                          }, label: '시작일'
      input 'end_date', as: :datepicker,
                        datepicker_options: {
                          min_date: '2018-08-08',
                          max_date: '+9D'
                        }, label: '종료일'

      input 'goal_money', label: '펀딩 목표 금액'
      input 'funded_count'
      input 'funded_money'
    end

    inputs 'Bill Infos' do
      input 'assos', label: '상임위원회 이름'
      input 'bill_id', label: '법안 번호'
      input 'bill_name', label: '법안 이름'
      input 'bill_url', label: '법안 링크'
    end

    inputs 'Images' do
      input 'image0', label: '상품 메인 이미지'
      input 'image1', label: '패키지 정리 이미지'
      input 'design_purpose', label: '디자인 의도 이미지'
    end

    input 'goods_dilivery_date', as: :datepicker,
                                 datepicker_options: {
                                   min_date: '2018-08-08',
                                   max_date: '+9D'
                                 }, label: '굿즈배송일'
    input 'visible', label: '공개 여부'
    actions
  end

  controller do
    def create
      super
      makers = Maker.where(assos: @product.assos)
      makers.each do |maker|
        MakerResponse.create(product_id: @product.id,
                             maker_id: maker.id,
                             name: maker.name,
                             send_count: 0,
                             agree_hash: SecureRandom.base64(50),
                             disagree_hash: SecureRandom.base64(50))
      end
      return if @product.visible == 0
      notif = Notification.all
      notif.each do |noti|
        begin
          title = @product.name + ' 법안 상품이 추가되었습니다.'
          Webpush.payload_send(
            message: { title: title, content: '구경하러 가기', link: 'https://tojung.me/product/'+@product.id.to_s }.to_json,
            endpoint: noti.endpoint,
            p256dh: noti.p256h,
            auth: noti.auth,
            ttl: 24 * 60 * 60,
            vapid: {
              subject: 'mailto:geniuslim27@gmail.com',
              public_key: ENV['VAPID_PUBLIC_KEY'],
              private_key: ENV['VAPID_PRIVATE_KEY']
            }
          )
          puts 'succ' * 1000
        rescue StandardError
          puts '?!' * 1000
        end
      end
      # Rails.cache.clear
    end

    def update
      super
      if @product.maker_responses.empty?
        makers = Maker.where(assos: @product.assos)
        makers.each do |maker|
          MakerResponse.create(product_id: @product.id,
                               maker_id: maker.id,
                               name: maker.name,
                               send_count: 0,
                               agree_hash: SecureRandom.base64(50),
                               disagree_hash: SecureRandom.base64(50))
        end

      end

      if @product.visible == 0
        return
      end
      notif = Notification.all
      notif.each do |noti|
        begin
          title = @product.name + ' 법안 상품이 수정되었습니다.'
          Webpush.payload_send(
            message: { title: title, content: '구경하러 가기', link: 'https://tojung.me/product/'+@product.id.to_s }.to_json,
            endpoint: noti.endpoint,
            p256dh: noti.p256h,
            auth: noti.auth,
            ttl: 24 * 60 * 60,
            vapid: {
              subject: 'mailto:geniuslim27@gmail.com',
              public_key: ENV['VAPID_PUBLIC_KEY'],
              private_key: ENV['VAPID_PRIVATE_KEY']
            }
          )
          puts 'succ' * 1000
        rescue StandardError
          puts '?!' * 1000
        end
      end
      # Rails.cache.clear
    end
  end
end
